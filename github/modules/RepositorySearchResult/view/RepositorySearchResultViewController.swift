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

final class RepositorySearchResultViewController: UIViewController {

    var presenter: RepositorySearchResultViewPresentation!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private let preheater = ImagePreheater()
    
    private var repositories: [Repository] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.flashScrollIndicators()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Search"
        
        tableView.register(RepositoryCell.self)
        tableView.refreshControl = UIRefreshControl { _ in
            self.presenter.refreshControlDidRefresh()
        }
        
        tableView.prefetchDataSource = self
        
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
    
    func updateSearchResults(_ repositories: [Repository]) {
        self.repositories = repositories
    }
    
    func showSearchErrorAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "エラー",
                                          message: "検索に失敗しました。時間をおいて再度お試しください。",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func scrollToTop() {
        DispatchQueue.main.async {
            self.tableView.setContentOffset(.zero, animated: true)
        }
    }
}

extension RepositorySearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(repository: repositories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension RepositorySearchResultViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        preheater.startPreheating(with: indexPaths.map { repositories[$0.row].owner.avatarUrl })
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        preheater.stopPreheating(with: indexPaths.map { repositories[$0.row].owner.avatarUrl })
    }
}
