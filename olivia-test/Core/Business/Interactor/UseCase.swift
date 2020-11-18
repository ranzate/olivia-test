//
//  UseCase.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class UseCase<P,R> {
    var params: P?
    
    func process(with params: P?, completion: @escaping (Swift.Result<R, BussinessError>) -> Void) {
        do {
            try validate(with: params)
            execute(with: params, completion: completion)
        } catch let error as BussinessError {
            completion(.failure(error))
        } catch {
            completion(.failure(BussinessError(message: "System Unavailable")))
        }
    }
    
    func execute(with params: P?, completion: @escaping (Swift.Result<R, BussinessError>) -> Void) {
    }
    
    func validate(with params: P?) throws {
    }
}
