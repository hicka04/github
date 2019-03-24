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
    @IBOutlet private weak var searchTypeSegment: UISegmentedControl! {
        didSet {
            searchTypeSegment.on(.valueChanged) { segmentedControl in
                self.searchBar.setShowsCancelButton(false, animated: true)
                self.searchBar.resignFirstResponder()
                self.languageTextField.resignFirstResponder()
                
                let index = segmentedControl.selectedSegmentIndex
                self.presenter.searchTypeSegmentValueChanged(selectedSegmentIndex: index)
            }
        }
    }
    @IBOutlet private weak var languageTextField: LanguageTextField! {
        didSet {
            languageTextField.languageTextFieldDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
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
        searchBar.setShowsCancelButton(true, animated: true)
        presenter.searchBarTextDidBeginEditing()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
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

extension SearchOptionsViewController: LanguageTextFieldDelegate {
    
    func languageTextFieldDidBeginSelecting(_ textField: LanguageTextField) {
        presenter.languageTextFieldDidBeginSelecting()
    }
    
    func languageTextFieldDidPushDoneButton(_ textField: LanguageTextField, selectedLanguage: SearchLanguage) {
        presenter.languageTextFieldDidPushDoneButton(selectedLanguage: selectedLanguage)
    }
    
    func languageTextFieldDidPushCancelButton(_ textField: LanguageTextField) {
        presenter.languageTextFieldDidPushCancelButton()
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
            searchBar.setShowsCancelButton(false, animated: true)
            searchBar.resignFirstResponder()
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
        default:
            UIView.animate(withDuration: 0.2) {
                self.stackView.alpha = 1
            }
        }
    }
}
