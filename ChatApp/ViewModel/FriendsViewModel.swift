//
//  FriendsViewModel.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

class FriendsViewModel {
    weak var viewController: chatViewControllable?
    var repository: chatRepositoryProtocol = ResolverFactory.resolve(dependency: chatRepositoryProtocol.self)
    
    init(viewController: chatViewControllable) {
        self.viewController = viewController
    }

    private func responseForFriends(response: friendsResponse) {
        if response.result {
            viewController?.showFriends(friends: response)
        } else {
            guard let error = response.error else { return }
            viewController?.networkError(info: error)
        }
    }
    
    private func networkFailure(error: Error) {
        if let networkError = error as? NetworkingError {
            viewController?.networkError(info: networkError.localizedDescription)
        }
    }

}

extension FriendsViewModel: chatViewModelable {
    
    func getFriends(for name: String, uniqueId: String) {
        viewController?.showLoadingIndicator()
        repository.getFriends(for: name, uniqueId: uniqueId) { [weak self] result in
            if let self = self {
                self.viewController?.hideLoadingIndicator()
                switch result {
                case .success(let response):
                    self.responseForFriends(response: response)
                case .failure(let error):
                    self.networkFailure(error: error)
                }
            }
        }
    }
}
