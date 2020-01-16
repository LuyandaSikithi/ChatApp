//
//  Resolvable.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

protocol Resolvable {
    func resolve<T>(_ dependency: T.Type) -> T
    func reset()
}
