//
//  RepositorySearchResultViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import ActionClosurable
import Nuke
import SkeletonView
import entity

protocol RepositorySearchResultView: SearchResultView where Result == Repository {
    
    func showSearchErrorAlert()
}

final class RepositorySearchResultViewController: UIViewController {

    var presenter: RepositorySearchResultViewPresentation!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(RepositoryCell.self)
            tableView.refreshControl = UIRefreshControl { _ in
                self.presenter.refreshControlDidRefresh()
            }
            
            tableView.prefetchDataSource = self
        }
    }
    
    private let preheater = ImagePreheater()
    
    private var repositories: [Repository]? {
        didSet {
            DispatchQueue.main.async {
                self.view.hideSkeleton()
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.flashScrollIndicators()
                self.tableView.allowsSelection = self.repositories != nil
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

extension RepositorySearchResultViewController: RepositorySearchResultView {
    
    func updateSearchResults(_ results: [Repository]) {
        repositories = results
    }
    
    func scrollToTop() {
        DispatchQueue.main.async {
            self.tableView.setContentOffset(.zero, animated: true)
        }
    }
}

extension RepositorySearchResultViewController: SkeletonTableViewDelegate, SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories?.count ?? 0
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return RepositoryCell.reuseIdentifier
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(repository: repositories![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension RepositorySearchResultViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let repositories = repositories else {
            return
        }
        preheater.startPreheating(with: indexPaths.map { repositories[$0.row].owner.avatarUrl })
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        guard let repositories = repositories else {
            return
        }
        preheater.stopPreheating(with: indexPaths.map { repositories[$0.row].owner.avatarUrl })
    }
}
