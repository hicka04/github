//
//  RepositoryBookmarkViewController.swift
//  github
//
//  Created by hikaru on 2019/4/24.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import entity

protocol RepositoryBookmarkView: BookmarkView where BookmarkEntity == Repository {}

final class RepositoryBookmarkViewController: UITableViewController {
    
    var presenter: RepositoryBookmarkViewPresentation!
    
    private var repositories: [Repository] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RepositoryCell.self)

        presenter.viewDidLoad()
    }
}

extension RepositoryBookmarkViewController: RepositoryBookmarkView {
    
    func update(_ entities: [Repository]) {
        repositories = entities
    }
}

extension RepositoryBookmarkViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(repository: repositories[indexPath.row])
        return cell
    }
}
