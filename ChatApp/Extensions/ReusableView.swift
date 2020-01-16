//
//  ReusableView.swift
//  ChatApp
//
//  Created by Luyanda Sikithi on 2020/01/16.
//  Copyright © 2020 Luyanda.Sikithi. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
