//
//  ProductRepositoryMock.swift
//  olivia-testTests
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation
@testable import olivia_test

class ProductRepositoryMock: ProductRepositoryProtocol {
    var returnSuccess = true
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        if returnSuccess {
            completion(.success([Product(code: "", name: "", price: 0.0)]))
        } else {
            completion(.failure(BussinessError(message: "Error")))
        }
    }
}
