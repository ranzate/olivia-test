//
//  Inject.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

class Dependencies {
    static let shared = Dependencies()
    private var factories = [String: () -> Any]()
    
    func add<T>(_ factory: @escaping () -> T) {
        let key = String(describing: T.self)
        factories[key] = factory
    }

    func resolve<T>() -> T {
        var key = String(describing: T.self)
        key = key.replacingOccurrences(of: "Optional<", with: "")
        key = key.replacingOccurrences(of: ">", with: "")
        
        guard let component: T = factories[key]?() as? T else {
            fatalError("Dependency '\(T.self)' not resolved!")
        }
        
        return component
    }
}

@propertyWrapper
public struct Inject<Value> {
    
    public var wrappedValue: Value {
        return Dependencies.shared.resolve()
    }
    
    public init() {}
}
