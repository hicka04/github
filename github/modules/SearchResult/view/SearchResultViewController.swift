//
//  SearchResultViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class SearchResultViewController: UITableViewController {

    var presenter: SearchResultViewPresentation!
    
    lazy var searchController: UISearchController = {
        let searchContrller = UISearchController(searchResultsController: nil)
        searchContrller.searchBar.delegate = self
        searchContrller.searchBar.placeholder = "キーワードを入力"
        return searchContrller
    }()
    
    private var repositories: [Repository] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
}

extension SearchResultViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(repository: repositories[indexPath.row])
        
        return cell
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
