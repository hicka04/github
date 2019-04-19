//
//  UserSearchResultViewController.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import Nuke
import SkeletonView
import entity

protocol UserSearchResultView: SearchResultView where Result == User {
    
}

final class UserSearchResultViewController: UIViewController {
    
    var presenter: UserSearchResultViewPresentation!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(UserCell.self)
            tableView.refreshControl = UIRefreshControl { _ in
                self.presenter.refreshControlDidRefresh()
            }
            
            tableView.prefetchDataSource = self
        }
    }
    
    private let preheater = ImagePreheater()
    
    private var users: [User]? {
        didSet {
            DispatchQueue.main.async {
                self.view.hideSkeleton()
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.flashScrollIndicators()
                self.tableView.allowsSelection = self.users != nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.showAnimatedSkeleton()

        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

extension UserSearchResultViewController: UserSearchResultView {
    
    func updateSearchResults(_ results: [User]) {
        self.users = results
    }
    
    func scrollToTop() {
        DispatchQueue.main.async {
            self.tableView.setContentOffset(.zero, animated: true)
        }
    }
}

extension UserSearchResultViewController: SkeletonTableViewDelegate, SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return UserCell.reuseIdentifier
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(user: users![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return users != nil ? indexPath : nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension UserSearchResultViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let users = users else { return }
        
        preheater.startPreheating(with: indexPaths.map { users[$0.row].avatarUrl })
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        guard let users = users else { return }
        
        preheater.stopPreheating(with: indexPaths.map { users[$0.row].avatarUrl })
    }
}
