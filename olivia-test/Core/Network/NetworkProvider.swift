//
//  NetworkProvider.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

protocol NetworkProviderProtocol {
    func request<R: Codable>(request: BaseRequest, completion: @escaping (Swift.Result<R, Error>) -> Void)
}

class NetworkProvider: NetworkProviderProtocol {
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func request<R>(request: BaseRequest, completion: @escaping (Result<R, Error>) -> Void) where R : Decodable, R : Encodable {
        session.dataTask(with: request.asURLRequest()) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data else {
                    completion(.failure(NSError.init(domain: "System Unavailable", code: -1, userInfo: nil)))
                    return
                }
                do {
                    let object = try self.decoder.decode(R.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(NSError.init(domain: "System Unavailable", code: -1, userInfo: nil)))
                }
            }
        }.resume()
    }
}
