//
//  UserSearchResultViewController.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import Nuke

protocol UserSearchResultView: SearchResultView where Result == User {
    
}

final class UserSearchResultViewController: UITableViewController {
    
    var presenter: UserSearchResultViewPresentation!
    
    private let preheater = ImagePreheater()
    
    private var users: [User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserCell.self)
        
        tableView.prefetchDataSource = self

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
        let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(user: users[indexPath.row])
        return cell
    }
}

extension UserSearchResultViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        preheater.startPreheating(with: indexPaths.map { users[$0.row].avatarUrl })
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        preheater.stopPreheating(with: indexPaths.map { users[$0.row].avatarUrl })
    }
}
