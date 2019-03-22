//
//  UserSearchResultViewController.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol UserSearchResultView: SearchResultView where Result == User {
    
}

final class UserSearchResultViewController: UITableViewController {
    
    var presenter: UserSearchResultViewPresentation!
    
    private var users: [User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension UserSearchResultViewController: UserSearchResultView {
    
    func updateSearchResults(_ results: [User]) {
        users = results
    }
}

extension UserSearchResultViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = users[indexPath.row].login
        return cell
    }
}
