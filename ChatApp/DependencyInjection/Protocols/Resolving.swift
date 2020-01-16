//
//  Resolving.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

protocol Resolving {
    static func resolve<T>(dependency: T.Type) -> T
    static func reset()
}
