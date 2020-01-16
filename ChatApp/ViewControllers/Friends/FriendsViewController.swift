//
//  FriendsViewController.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var name: String?
    var uniqueID: String?
    
    private var friends: friendsResponse?
    
    lazy var viewModel: chatViewModelable = {
        return FriendsViewModel(viewController: self)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendsTableViewCell.self)
        title = "Friends"
        if let Name = name, let id = uniqueID {
            viewModel.getFriends(for: Name, uniqueId: id)
        }else{
            showAlertMessage( message: "User credidentials not found", imageName: "")
        }
        
    }
    
    
}

extension FriendsViewController: chatViewControllable {
    
    func showFriends(friends: friendsResponse) {
        self.friends = friends
        tableView.reloadData()
    }
    
    func showDetails(friend: friend) {
        let friendDetailsVC = FriendsDetailsViewController(nibName: "FriendsDetailsViewController", bundle: nil)
        friendDetailsVC.friend = friend
        self.navigationController?.pushViewController(friendDetailsVC, animated: true)
    }

    func networkError(info: String) {
        
    }
    
    func showLoadingIndicator() {
        showActivityIndicatory()
    }
    
    func hideLoadingIndicator() {
        hideActivityIndicatory()
    }
    
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends?.friends.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(forIndexPath: indexPath) as FriendsTableViewCell
        let friend = friends?.friends[indexPath.row]
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width/2
        cell.profileImage.downloaded(from: friend?.imageURL ?? "")
        cell.lblAlias.text = friend?.alias
        
        if friend?.status.lowercased() == "offline" {
            cell.lblLastScene.text = friend?.lastSeen?.toDate().timeAgo()
        }else{
            cell.lblLastScene.text = friend?.status
        }
        
        switch friend?.status {
        case "Online":
            cell.lblLastScene.textColor = .green
        case "Busy":
            cell.lblLastScene.textColor = .orange
        case "Away":
            cell.lblLastScene.textColor = .red
        default:
            break
        }
        
        cell.InfoButtonAction = { sender in
            if let friendInfor = friend {
                self.showDetails(friend: friendInfor)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
