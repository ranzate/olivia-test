//
//  DiscountStrategies.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

protocol DiscountStrategy {
    func apply(to products: [CheckoutItem], total: Double) -> Double
}
