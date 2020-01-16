//
//  LoginParameters.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

struct LoginParameters: Encodable {
    let username: String
    let password: String
    
    func toJSON() -> [String: Any] {
        return [
            "username": username,
            "password": password,
        ]
    }
}
