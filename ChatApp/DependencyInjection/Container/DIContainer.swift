//
//  Container.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation
import Swinject

class DIContainer {
    let container: Container = Container()
    private init() {}
    public static let instance = DIContainer()
}

extension DIContainer: Registrable {
    func register<T>(dependency: T.Type, implementation: @escaping (Resolvable) -> T,
                     objectScope: ObjectScope = .graph) {
        container.register(dependency, factory: { _ in
            return implementation(self)
        }).inObjectScope(objectScope)
    }
}

extension DIContainer: Resolvable {
    func resolve<T>(_ dependency: T.Type) -> T {
        guard let implementation = container.resolve(dependency) else {
            fatalError("Sorry could not resolve your dependency. Make sure that this dependency is registered.")
        }
        return implementation
    }
    func reset() {
        container.removeAll()
    }
}
