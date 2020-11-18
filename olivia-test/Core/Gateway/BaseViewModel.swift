//
//  BaseViewModel.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation
import Combine

class BaseViewModel {
    
    var error: Observable<String> = Observable("")
    
    func dispatch<P,R>(useCase: UseCase<P,R>, param: P?, completion: @escaping (Swift.Result<R, BussinessError>) -> Void) {
        UseCaseDispatcher(useCase: useCase).dispatch(params: param, completion: completion)
    }
}
