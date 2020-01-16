//
//  DependencyRegister.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

func registerAllDependencies() {
    let container = DIContainer.instance
    container.register(dependency: HttpServicing.self, implementation: { _ in
        HttpService()
    }, objectScope: .weak)

    container.register(dependency: chatRepositoryProtocol.self, implementation: { _ in
        return chatRepository()
    }, objectScope: .weak)
}
