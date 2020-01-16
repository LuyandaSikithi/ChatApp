//
//  friend.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

struct friend: Codable {
    let firstName: String
    let lastName: String
    let alias: String
    let dateOfBirth: String
    let imageURL: String
    let status: String
    let lastSeen: String?
}
