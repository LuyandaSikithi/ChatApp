//
//  FriendsDetailsViewController.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/15.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import UIKit

class FriendsDetailsViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblAlias: UILabel!
    @IBOutlet weak var lblFullname: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDob: UILabel!
    
    var friend: friend!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpView(){
        profileImage.downloaded(from: friend?.imageURL ?? "")
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        lblAlias.text = friend.alias
        lblFullname.text = "\(friend.firstName) \(friend.lastName)"
        if friend.status.lowercased() == "offline" {
            lblStatus.text = friend.lastSeen?.toDate().timeAgo()
        }else{
            lblStatus.text = friend.status
        }
        
        switch friend?.status {
        case "Online":
            lblStatus.textColor = .green
        case "Busy":
            lblStatus.textColor = .orange
        case "Away":
            lblStatus.textColor = .red
        default:
            break
        }
        
        lblDob.text = friend.dateOfBirth
    }
}
