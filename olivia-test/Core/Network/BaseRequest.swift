//
//  BaseRequest.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

@objc protocol BaseRequest {
    var endpoint: String {get}
    var method: HTTPMethod {get}
    @objc optional var body: [String : Any] {get}
    @objc optional var headers: [String : String] {get}
}

extension BaseRequest {
    
    private func asURLRequestBase() -> URLRequest {
    
        let baseURL = URL(string: "http://5f7c87cd00bd74001690ae45.mockapi.io/api")
        
        var url = URL(string: self.endpoint)
        if (baseURL?.absoluteString != nil) {
            url = URL(string: "\(baseURL!.absoluteString)\(self.endpoint)")
        }
        
        var request = URLRequest(url: url!)
        
        let cachePolicy = URLRequest.CachePolicy.useProtocolCachePolicy
 
        request.timeoutInterval = 30.0
        request.cachePolicy = cachePolicy
        
        request.httpMethod = self.method.toString()
        
        if let headers = self.headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        return request
    }
    
    func asURLRequest() -> URLRequest {
 
        var request = asURLRequestBase()
        
        if let body = self.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        return request
    }
}
