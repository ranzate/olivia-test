//
//  BulkPurchasesDiscountStrategy.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class BulkPurchasesDiscountStrategy: DiscountStrategy {
    let productNotAllowDiscountCode = "PEN"
    
    func apply(to products: [CheckoutItem], total: Double) -> Double {
        let filteredProducts = products.filter({ $0.code != productNotAllowDiscountCode })
        var totalWithDiscount = total
        filteredProducts.forEach({
            if isProductDiscount($0) {
                let totalDiscount = Double($0.amount) * 1.0
                totalWithDiscount = totalWithDiscount - totalDiscount
            }
        })
        return totalWithDiscount
    }
    
    private func isProductDiscount(_ product: CheckoutItem) -> Bool {
        return product.amount >= 3
    }
}
