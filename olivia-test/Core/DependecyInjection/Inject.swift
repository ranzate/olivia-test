//
//  Inject.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

@propertyWrapper
public class Inject<Value> {
    private let name: String?
    private var storage: Value?
    
    public var wrappedValue: Value {
        storage ?? {
            let value: Value = Dependencies.root.resolve(for: name)
            storage = value // Reuse instance for later
            return value
        }()
    }
    
    public init() {
        self.name = nil
    }
    
    public init(_ name: String) {
        self.name = name
    }
}
