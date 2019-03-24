//
//  SearchOptionsViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol SearchOptionsViewPresentation: AnyObject {

    func viewDidLoad()
    // KeywordSearchBar
    func keywordSearchBarTextDidBeginEditing()
    func keywordSearchBarSearchButtonClicked(_ searchBarText: String)
    func keywordSearchBarCancelButtonClicked()
    // SearchTypeSegment
    func searchTypeSegmentValueChanged(selectedSegmentIndex: Int)
    // LanguageTextField
    func languageTextFieldDidBeginSelecting()
    func languageTextFieldDidPushDoneButton(selectedLanguage: SearchLanguage)
    func languageTextFieldDidPushCancelButton()
}


final class SearchOptionsViewPresenter {

    private weak var view: SearchOptionsView?
    private let router: SearchOptionsWireframe
    private let historyInteractor: SearchOptionsHistoryUsecase
    
    private var searchOptionsState: SearchOptionsState = .notYetLoaded {
        didSet {
            switch searchOptionsState {
            case .notYetLoaded:
                assertionFailure("nil not supported")
                
            case .loaded(let searchOptions):
                guard let searchOptions = searchOptions else {
                    return
                }
                view?.setLastSearchOptions(searchOptions)
                
            case .updated(let searchOptions):
                try? historyInteractor.save(searchOptions: searchOptions)
            }
        }
    }
    
    init(view: SearchOptionsView,
         router: SearchOptionsWireframe,
         historyInteractor: SearchOptionsHistoryUsecase) {
        self.view = view
        self.router = router
        self.historyInteractor = historyInteractor
    }
}

extension SearchOptionsViewPresenter: SearchOptionsViewPresentation {
    
    func viewDidLoad() {
        searchOptionsState = .loaded(historyInteractor.lastSearchOptions())
    }
    
    func keywordSearchBarTextDidBeginEditing() {
        router.moveToFull()
    }
    
    func keywordSearchBarSearchButtonClicked(_ searchBarText: String) {
        searchOptionsState.update(keyword: searchBarText)
        router.moveToTip()
    }
    
    func keywordSearchBarCancelButtonClicked() {
        router.moveToHalf()
    }
    
    func searchTypeSegmentValueChanged(selectedSegmentIndex: Int) {
        guard let searchType = SearchOptions.SearchType(rawValue: selectedSegmentIndex) else {
            return
        }
        
        searchOptionsState.update(searchType: searchType)
        router.moveToHalf()
    }
    
    func languageTextFieldDidBeginSelecting() {
        router.moveToFull()
    }
    
    func languageTextFieldDidPushDoneButton(selectedLanguage: SearchLanguage) {
        router.moveToHalf()
    }
    
    func languageTextFieldDidPushCancelButton() {
        router.moveToHalf()
    }
}

extension SearchOptionsViewPresenter {
    
    enum SearchOptionsState {
        case notYetLoaded
        case loaded(SearchOptions?)
        case updated(SearchOptions)
        
        mutating func update(keyword: String) {
            self = .updated(SearchOptions(keyword: keyword,
                                          searchType: currentSearchType))
        }
        
        mutating func update(searchType: SearchOptions.SearchType) {
            guard let keyword = currentSearchKeyword else { return }
            
            self = .updated(SearchOptions(keyword: keyword,
                                          searchType: searchType))
        }
        
        private var currentSearchKeyword: String? {
            switch self {
            case .loaded(let options?),
                 .updated(let options):
                return options.keyword
            default:
                return nil
            }
        }
        
        private var currentSearchType: SearchOptions.SearchType {
            switch self {
            case .loaded(let options?),
                 .updated(let options):
                return options.searchType
            default:
                return .repository
            }
        }
    }
}
