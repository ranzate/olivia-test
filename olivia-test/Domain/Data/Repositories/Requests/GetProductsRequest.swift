//
//  GetProductsRequest.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class GetProductsRequest: BaseRequest {
    var endpoint: String {
        return "/v1/products"
    }
    
    var method: HTTPMethod {
        return .get
    }
}
