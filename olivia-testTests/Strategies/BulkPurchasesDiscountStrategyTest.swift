//
//  BulkPurchasesDiscountStrategyTest.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import XCTest
@testable import olivia_test

class BulkPurchasesDiscountStrategyTest: XCTestCase {

    func testApplyDiscount() throws {
        let items = [CheckoutItem(name: "T-Shirt", code: "TSHIRT", amount: 5, price: 10)]
        XCTAssertEqual(BulkPurchasesDiscountStrategy().apply(to: items, total: 50), 45.0)
    }
    
    func testProductWithoutDiscount() throws {
        let items = [CheckoutItem(name: "T-Shirt", code: "TSHIRT", amount: 2, price: 10)]
        XCTAssertEqual(BulkPurchasesDiscountStrategy().apply(to: items, total: 20.0), 20.0)
    }

}
