//
//  loginResponse.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

struct loginResponse: Codable {
    let result: Bool
    let guid: String?
    let firstName: String?
    let lastName: String?
    let error: String?
}
