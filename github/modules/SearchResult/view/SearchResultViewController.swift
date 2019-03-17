//
//  SearchResultViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import ActionClosurable
import Nuke

final class SearchResultViewController: UIViewController {

    var presenter: SearchResultViewPresentation!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    lazy var searchController: UISearchController = {
        let searchContrller = UISearchController(searchResultsController: nil)
        searchContrller.searchBar.delegate = self
        searchContrller.searchBar.placeholder = "キーワードを入力"
        return searchContrller
    }()
    
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
        
        title = "Search"
        
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        tableView.register(RepositoryCell.self)
        tableView.refreshControl = UIRefreshControl { _ in
            guard let searchBarText = self.searchController.searchBar.text else { return }
            self.presenter.refreshControlDidRefresh(text: searchBarText)
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

extension SearchResultViewController: SearchResultView {
    
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
    
    func setLastSearchKeyword(_ keyword: String) {
        searchController.searchBar.text = keyword
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
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

extension SearchResultViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        preheater.startPreheating(with: indexPaths.map { repositories[$0.row].owner.avatarUrl })
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        preheater.stopPreheating(with: indexPaths.map { repositories[$0.row].owner.avatarUrl })
    }
}

extension SearchResultViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        defer {
            searchController.dismiss(animated: true, completion: nil)
        }
        
        guard let searchBarText = searchBar.text else {
            return
        }
        
        presenter.searchBarSearchButtonClicked(text: searchBarText)
    }
}
