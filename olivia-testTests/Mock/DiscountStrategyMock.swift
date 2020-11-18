//
//  DiscountStrategyMock.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation
@testable import olivia_test

class DiscountStrategyMock: DiscountStrategy {
    func apply(to products: [CheckoutItem], total: Double) -> Double {
        return 10.0
    }
}
