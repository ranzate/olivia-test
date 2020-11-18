//
//  TwoForOneDiscount.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class TwoForOneDiscountStrategy: DiscountStrategy {
    let productAllowDiscountCode = "PEN"
    
    func apply(to products: [CheckoutItem], total: Double) -> Double {
        guard let filteredProduct = products.filter({ $0.code == productAllowDiscountCode }).first, filteredProduct.amount >= 2 else {
            return total
        }
        
        var multiplyDiscount = filteredProduct.amount / 2
        if (filteredProduct.amount % 2) != 0 {
            multiplyDiscount = (filteredProduct.amount - 1) / 2
        }
        
        return total - filteredProduct.price * Double(multiplyDiscount)
    }
}
