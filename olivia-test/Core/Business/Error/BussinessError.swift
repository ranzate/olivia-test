//
//  BussinessError.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class BussinessError: Error {
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    var localizedDescription: String {
        return message
    }
}
