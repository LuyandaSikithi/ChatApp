//
//  Protocols.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation
import Swinject

protocol Registrable {
    func register<T>(dependency: T.Type,
                     implementation: @escaping (_ resolver: Resolvable) -> T,
                     objectScope: ObjectScope)
}
