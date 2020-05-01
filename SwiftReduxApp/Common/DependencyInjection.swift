//
//  DependencyInjection.swift
//  KMart
//
//  Created by Bách on 5/1/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation

protocol Locator {
    func resolve<T>() -> T?
}

final class DIContainer: Locator {
    private var services: [ObjectIdentifier: Any] = [:]
    
    func register<T>(_ registerBlock: () -> T) {
        services[key(for: T.self)] = registerBlock()
    }
    
    func resolve<T>() -> T {
        let dependency = services[key(for: T.self)] as? T
        
        if dependency == nil {
            fatalError("[DI] Services \(T.self) not register in Container, To Register: [AppDelegate] -> registerDependency()")
        }
        
        return dependency!
    }

    private func key<T>(for type: T.Type) -> ObjectIdentifier {
        return ObjectIdentifier(T.self)
    }
}
