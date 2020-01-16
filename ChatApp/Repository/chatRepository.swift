//
//  chatRepository.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

class chatRepository: chatRepositoryProtocol {
    var httpService: HttpServicing = ResolverFactory.resolve(dependency: HttpServicing.self)
    
    func authenticateUser(with username: String, password: String, completion: @escaping (Result<loginResponse, Error>) -> Void) {
        
        let params = LoginParameters(username: username, password: password)
        httpService.postRequest(url: "\(constants.baseURL)\(path.login.rawValue)", parameters: params.toJSON(),
            success: { (response: loginResponse) in
                completion(Result.success(response))
        }, error: {(error: NetworkingError) in
            completion(Result.failure(error))
        })
    }
    
    func getFriends(for name: String, uniqueId: String,
                          completion: @escaping (Result<friendsResponse, Error>) -> Void) {
        httpService.getRequest(url:
            "\(constants.baseURL)\(path.friends.rawValue);uniqueID=\(uniqueId);name=\(name)",
            success: { (response: friendsResponse) in
                completion(Result.success(response))
        }, error: { (error: NetworkingError) in
            completion(Result.failure(error))
        })
    }
}
