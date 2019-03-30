//
//  UserCell.swift
//  github
//
//  Created by hicka04 on 2019/03/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import entity

class UserCell: UITableViewCell, NibRegistrable {

    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    
    func set(user: User) {
        userImageView.load(with: user.avatarUrl)
        userNameLabel.text = user.login
    }
}
