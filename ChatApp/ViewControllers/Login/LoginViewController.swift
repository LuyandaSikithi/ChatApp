//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import UIKit
import StatusAlert

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    lazy var viewModel: chatViewModelable = {
        return LoginViewModel(viewController: self)
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI(){

    }
    
    @IBAction func LoginTapped(_ sender: Any) {
        guard let user = username.text, username.text != ""  else {
            showAlertMessage( message: "Username cannot be empty", imageName: "")
            return
        }
        
        guard let pass = password.text, password.text != ""  else {
            showAlertMessage(message: "Password cannot be empty", imageName: "")
            return
        }
        
        viewModel.authenticateUser(with: user, password: pass)
    }
    
}

extension LoginViewController: chatViewControllable {
    
    func showFriendList(screen: String, name: String, uniqueID: String) {
        let friendVC = FriendsViewController(nibName: screen, bundle: nil)
        friendVC.name = name
        friendVC.uniqueID = uniqueID
        let nav = UINavigationController(rootViewController: friendVC)
        self.present(nav, animated: true)
    }
    
    func networkError(info: String) {
        showAlertMessage( message: info, imageName: "")
    }
    
    func showLoadingIndicator() {
        showActivityIndicatory()
    }
    
    func hideLoadingIndicator() {
        hideActivityIndicatory()
    }
}
