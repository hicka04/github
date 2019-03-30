//
//  SearchResultContainerViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol SearchResultContainerViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class SearchResultContainerViewPresenter {

    private weak var view: SearchResultContainerView?
    private let router: SearchResultContainerWireframe
    private let interactor: SearchOptionsHistoryUsecase
    
    private var searchType: SearchOptions.SearchType? {
        didSet {
            guard let searchType = searchType,
                searchType != oldValue else {
                return
            }
            
            switch searchType {
            case .repository:
                router.showRepositorySearchResultView()
            case .user:
                router.showUserSearchResultView()
            }
        }
    }
    
    init(view: SearchResultContainerView,
         router: SearchResultContainerWireframe,
         interactor: SearchOptionsHistoryUsecase) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchResultContainerViewPresenter: SearchResultContainerViewPresentation {
    
    func viewDidLoad() {
        interactor.observe { [weak self] searchOptions in
            self?.searchType = searchOptions?.searchType
        }
        
        router.showSearchOptionsView()
    }
}
