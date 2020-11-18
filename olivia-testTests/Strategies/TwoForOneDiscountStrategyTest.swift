//
//  TwoForOneDiscountStrategyTest.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import XCTest
@testable import olivia_test

class TwoForOneDiscountStrategyTest: XCTestCase {

    func testApplyDiscount() throws {
        let items = [CheckoutItem(name: "Pen", code: "PEN", amount: 3, price: 5.0)]
        XCTAssertEqual(TwoForOneDiscountStrategy().apply(to: items, total: 15), 10.0)
    }
    
    func testProductWithoutDiscount() throws {
        let items = [CheckoutItem(name: "Pen", code: "PEN", amount: 1, price: 5.0)]
        XCTAssertEqual(TwoForOneDiscountStrategy().apply(to: items, total: 5.0), 5.0)
    }

}
