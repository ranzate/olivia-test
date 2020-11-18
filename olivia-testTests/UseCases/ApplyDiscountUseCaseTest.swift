//
//  ApplyDiscountUseCaseTest.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import XCTest
@testable import olivia_test

class ApplyDiscountUseCaseTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testExecute() {
        let expect = expectation(description: "Execute Success")
        let useCase = ApplyDiscountUseCase([DiscountStrategyMock()])
        let items = [CheckoutItem(name: "Teste", code: "TESTE", amount: 0, price: 10.0)]
        var totalWithDiscount = 0.0
        useCase.execute(with: items) { (response) in
            switch response {
            case .success(let total):
                totalWithDiscount = total
                expect.fulfill()
            default:
                expect.fulfill()
                break
            }
        }
        
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("\(error)")
            }
            XCTAssertEqual(10.0, totalWithDiscount)
        }
    }
}
