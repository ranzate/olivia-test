//
//  BaseRepository.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

protocol BaseRepositoryProtocol {
    func perform<R: Codable>(request: BaseRequest, completion: @escaping (Swift.Result<R, Error>) -> Void)
}

class BaseRepository: BaseRepositoryProtocol {
    @Inject var networkProvider: NetworkProviderProtocol!
    
    func perform<R>(request: BaseRequest, completion: @escaping (Result<R, Error>) -> Void) where R : Decodable, R : Encodable {
        networkProvider.request(request: request, completion: completion)
    }
}
