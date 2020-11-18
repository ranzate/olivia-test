//
//  DoubleExtensionTest.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import XCTest
@testable import olivia_test

class DoubleExtensionTest: XCTestCase {

    func testFormatValue() {
        XCTAssertEqual(10.0.currencyFormatting(), "R$ 10,00")
    }

}
