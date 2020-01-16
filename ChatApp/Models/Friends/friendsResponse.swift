//
//  friendsResponse.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

struct friendsResponse: Codable {
    let result: Bool
    let friends: [friend]
    let error: String?
}
