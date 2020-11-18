//
//  HTTPMethod.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

@objc public enum HTTPMethod: Int {
    case options
    case get
    case post
    case put
    case patch
    case delete
    
    public func toString() -> String {
        switch self {
        case .options: return "OPTIONS"
        case .get:     return "GET"
        case .post:    return "POST"
        case .put:     return "PUT"
        case .patch:   return "PATCH"
        case .delete:  return "DELETE"
        }
    }
}
