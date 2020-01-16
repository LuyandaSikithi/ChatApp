//
//  FriendsTableViewCell.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/16.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell, NibView, ReusableView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblAlias: UILabel!
    @IBOutlet weak var lblLastScene: UILabel!
    @IBOutlet weak var btnInfo: UIButton!
    var InfoButtonAction: ((Any) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func InforButtonTapped(_ sender: Any) {
        self.InfoButtonAction?(sender)
    }
    
}
