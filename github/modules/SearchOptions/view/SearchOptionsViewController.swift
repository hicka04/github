//
//  SearchOptionsViewController.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import FloatingPanel
import ActionClosurable

protocol SearchOptionsView: AnyObject {
    
    func setLastSearchOptions(_ searchOptions: SearchOptions)
}

final class SearchOptionsViewController: UIViewController {
    
    var presenter: SearchOptionsViewPresentation!
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet weak var searchTypeSegment: UISegmentedControl! {
        didSet {
            searchTypeSegment.on(.valueChanged) { segmentedControl in
                self.hideKeyboard()
                let index = segmentedControl.selectedSegmentIndex
                self.presenter.searchTypeSegmentValueChanged(selectedSegmentIndex: index)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    
    private func showKeyboard() {
        if !searchBar.isFirstResponder {
            searchBar.becomeFirstResponder()
        }
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    private func hideKeyboard() {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
}

extension SearchOptionsViewController: SearchOptionsView {
    
    func setLastSearchOptions(_ searchOptions: SearchOptions) {
        searchBar.text = searchOptions.keyword
        searchTypeSegment.selectedSegmentIndex = searchOptions.searchType.rawValue
    }
}

extension SearchOptionsViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        showKeyboard()
        presenter.searchBarTextDidBeginEditing()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        hideKeyboard()
        
        guard let searchBarText = searchBar.text else {
            return
        }
        presenter.searchBarSearchButtonClicked(searchBarText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideKeyboard()
        presenter.searchBarSearchButtonClicked()
    }
}

extension SearchOptionsViewController: FloatingPanelControllerDelegate {
    
    func floatingPanelWillBeginDragging(_ vc: FloatingPanelController) {
        switch vc.position {
        case .tip:
            UIView.animate(withDuration: 0.2) {
                self.stackView.alpha = 1
            }
        case .full:
            hideKeyboard()
        default:
            break
        }
    }
    
    func floatingPanelDidChangePosition(_ vc: FloatingPanelController) {
        switch vc.position {
        case .tip:
            UIView.animate(withDuration: 0.1) {
                self.stackView.alpha = 0
            }
        case .full:
            showKeyboard()
            
            fallthrough
        default:
            UIView.animate(withDuration: 0.2) {
                self.stackView.alpha = 1
            }
        }
    }
}
