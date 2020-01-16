//
//  chatViewModelable.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

protocol chatViewModelable: class {
    func authenticateUser(with username: String, password: String)
    func getFriends(for name: String, uniqueId: String)
}

extension chatViewModelable {
    func authenticateUser(with username: String, password: String){}
    func getFriends(for name: String, uniqueId: String){}
}
