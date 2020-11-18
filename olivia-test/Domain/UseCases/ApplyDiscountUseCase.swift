//
//  ApplyDiscountUseCase.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class ApplyDiscountUseCase: UseCase<[CheckoutItem], Double> {
    
    var discountStrategies: [DiscountStrategy]!
    
    init(_ discountStrategies: [DiscountStrategy]) {
        self.discountStrategies = discountStrategies
    }
    
    override func execute(with params: [CheckoutItem]?, completion: @escaping (Result<Double, BussinessError>) -> Void) {
        guard let params = params else {
            completion(.success(0.0))
            return
        }
        
        var total = params.reduce(0.0, {
            $0 + Double($1.amount) * $1.price
        })
        
        discountStrategies.forEach({
            total = $0.apply(to: params, total: total)
        })
        
        completion(.success(total))
    }
}
