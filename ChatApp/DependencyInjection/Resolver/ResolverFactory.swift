//
//  ResolverFactory.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation
import Swinject

class ResolverFactory {
    private static var container: Resolvable = DIContainer.instance
}

extension ResolverFactory: Resolving {
    static func resolve<T>(dependency: T.Type) -> T {
        return container.resolve(dependency)
    }
    static func reset() {
        container.reset()
    }
}
