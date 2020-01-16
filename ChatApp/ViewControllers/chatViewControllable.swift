//
//  chatViewControllable.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

protocol chatViewControllable: class {
    func showFriendList(screen: String, name: String, uniqueID: String)
    func networkError(info: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showFriends(friends: friendsResponse)
    func showDetails(friend: friend)
}

extension chatViewControllable {
    func showFriends(friends: friendsResponse){}
    func showFriendList(screen: String, name: String, uniqueID: String){}
    func showDetails(friend: friend){}
}
