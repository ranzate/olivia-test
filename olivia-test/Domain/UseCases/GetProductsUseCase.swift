//
//  GetProductsUseCase.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class GetProductsUseCase: UseCase<Int, [Product]> {
    
    @Inject var productRepository: ProductRepositoryProtocol?
    
    override func execute(with params: Int?, completion: @escaping (Result<[Product], BussinessError>) -> Void) {
        productRepository?.getProducts { (response) in
            switch response {
            case .success(let products):
                completion(.success(products))
                return
            case .failure(let error):
                completion(.failure(BussinessError(message: error.localizedDescription)))
            }
        }
    }
}
