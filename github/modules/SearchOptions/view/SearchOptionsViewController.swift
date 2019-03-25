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
    
    @IBOutlet private weak var keywordSearchBar: KeywordSearchBar! {
        didSet {
            keywordSearchBar.on(.textDidBeginEditing) { [weak self] _ in
                self?.presenter.keywordSearchBarTextDidBeginEditing()
            }
            keywordSearchBar.on(.cancelButtonClicked) { [weak self] _ in
                self?.presenter.keywordSearchBarCancelButtonClicked()
            }
            keywordSearchBar.on(.searchButtonClicked) { [weak self] searchBar in
                guard let searchBarText = searchBar.text else {
                    return
                }
                self?.presenter.keywordSearchBarSearchButtonClicked(searchBarText)
            }
        }
    }
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var searchTypeSegment: UISegmentedControl! {
        didSet {
            searchTypeSegment.on(.valueChanged) { segmentedControl in
                self.keywordSearchBar.endEditing(false)
                self.languageTextField.endEditing(false)
                
                let index = segmentedControl.selectedSegmentIndex
                self.presenter.searchTypeSegmentValueChanged(selectedSegmentIndex: index)
            }
        }
    }
    @IBOutlet private weak var languageTextField: LanguageTextField! {
        didSet {
            languageTextField.didBeginSelecting { [weak self] _ in
                self?.presenter.languageTextFieldDidBeginSelecting()
            }
            languageTextField.doneButtonClicked { [weak self] _, language in
                self?.presenter.languageTextFieldDoneButtonClicked(selectedLanguage: language)
            }
            languageTextField.cancelButtonClicked { [weak self] _ in
                self?.presenter.languageTextFieldCancelButtonClicked()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension SearchOptionsViewController: SearchOptionsView {
    
    func setLastSearchOptions(_ searchOptions: SearchOptions) {
        keywordSearchBar.text = searchOptions.keyword
        searchTypeSegment.selectedSegmentIndex = searchOptions.searchType.rawValue
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
            keywordSearchBar.endEditing(false)
            languageTextField.endEditing(false)
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
