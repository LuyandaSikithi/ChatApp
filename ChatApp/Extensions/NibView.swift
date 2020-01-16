//
//  NibView.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/16.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import UIKit

protocol NibView: class {}

extension NibView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
