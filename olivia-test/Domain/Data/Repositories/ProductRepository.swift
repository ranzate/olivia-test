//
//  ProductRepository.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

protocol ProductRepositoryProtocol {
    func getProducts(completion: @escaping (Swift.Result<[Product], Error>) -> Void)
}

class ProductRepository: BaseRepository, ProductRepositoryProtocol {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        perform(request: GetProductsRequest(), completion: completion)
    }
}
