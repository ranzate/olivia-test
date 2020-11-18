//
//  GetProductsUseCaseTest.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

import XCTest
@testable import olivia_test

class GetProductsUseCaseTest: XCTestCase {
    
    var useCase: GetProductsUseCase!
    var repository: ProductRepositoryMock!
    override func setUp() {
        super.setUp()
        repository = ProductRepositoryMock()
        Dependencies.shared.add{( self.repository as ProductRepositoryProtocol )}
        useCase = GetProductsUseCase()
    }
    
    func testExecute() {
        let expect = expectation(description: "Execute Success")
        var products = [Product]()
        useCase.execute(with: nil) { (response) in
            switch response {
            case .success(let result):
                products = result
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
            XCTAssertFalse(products.isEmpty)
        }
    }
    
    func testExecuteFailed() {
        repository.returnSuccess = false
        let expect = expectation(description: "Execute Failed")
        var errorResult: Error?
        useCase.execute(with: nil) { (response) in
            switch response {
            case .failure(let result):
                errorResult = result
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
            XCTAssertTrue(errorResult is BussinessError)
        }
    }
}
