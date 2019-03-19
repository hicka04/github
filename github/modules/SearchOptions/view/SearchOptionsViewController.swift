//
//  SearchOptionsViewController.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import FloatingPanel

protocol SearchOptionsView: AnyObject {
    
    func setLastSearchKeyword(_ keyword: String)
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
    
    func setLastSearchKeyword(_ keyword: String) {
        searchBar.text = keyword
    }
}

extension SearchOptionsViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        presenter.searchBarTextDidBeginEditing()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        
        guard let searchBarText = searchBar.text else {
            return
        }
        presenter.searchBarSearchButtonClicked(searchBarText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        presenter.searchBarSearchButtonClicked()
    }
}

extension SearchOptionsViewController: FloatingPanelControllerDelegate {
    
    func floatingPanelWillBeginDragging(_ vc: FloatingPanelController) {
        guard vc.position == .full else {
            return
        }
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
}
