//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import Foundation

class LoginViewModel {
    weak var viewController: chatViewControllable?
    var repository: chatRepositoryProtocol = ResolverFactory.resolve(dependency: chatRepositoryProtocol.self)
    
    init(viewController: chatViewControllable) {
        self.viewController = viewController
    }
    
    private func responseForAuthentication(response: loginResponse) {
        if response.result {
            viewController?.showFriendList(screen: "FriendsViewController", name: response.firstName ?? "", uniqueID: response.guid ?? "" )
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

extension LoginViewModel: chatViewModelable {
    
    func authenticateUser(with username: String, password: String) {
        viewController?.showLoadingIndicator()
        repository.authenticateUser(with: username, password: password) { [weak self] result in
            if let self = self {
                self.viewController?.hideLoadingIndicator()
                switch result {
                case .success(let response):
                    self.responseForAuthentication(response: response)
                case .failure(let error):
                    self.networkFailure(error: error)
                }
            }
        }
    }
}
