//
//  UseCaseDispatcher.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class UseCaseDispatcher<P,R>: UseCase<P,R> {
    var useCase: UseCase<P, R>
    
    init(useCase: UseCase<P,R>) {
        self.useCase = useCase
    }
    
    func dispatch(params: P?, completion: @escaping (Swift.Result<R, BussinessError>) -> Void) {
        useCase.process(with: params, completion: completion)
    }
}
