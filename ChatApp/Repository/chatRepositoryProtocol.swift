//
//  chatRepositoryProtocol.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

protocol chatRepositoryProtocol: class {
    func authenticateUser(with username: String, password: String, completion: @escaping (Result<loginResponse, Error>) -> Void)
    
    func getFriends(for name: String, uniqueId: String,
                          completion: @escaping (Result<friendsResponse, Error>) -> Void)
}
