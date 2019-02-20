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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension SearchResultViewController: SearchResultView {
    
}

extension SearchResultViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
