//
//  SearchOptionsViewController.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol SearchOptionsView: AnyObject {
    
}

final class SearchOptionsViewController: UIViewController {
    
    var presenter: SearchOptionsViewPresentation!
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension SearchOptionsViewController: SearchOptionsView {
    
}

extension SearchOptionsViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
}
