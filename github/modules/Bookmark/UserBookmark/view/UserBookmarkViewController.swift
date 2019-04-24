//
//  UserBookmarkViewController.swift
//  github
//
//  Created by hikaru on 2019/4/24.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import entity

protocol UserBookmarkView: BookmarkView where BookmarkEntity == User {
    
}

final class UserBookmarkViewController: UITableViewController {
    
    var presenter: UserBookmarkViewPresentation!
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserCell.self)

        presenter.viewDidLoad()
    }
}

extension UserBookmarkViewController: UserBookmarkView {
    
    func update(_ entities: [User]) {
        users = entities
    }
}

extension UserBookmarkViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(user: users[indexPath.row])
        return cell
    }
}
