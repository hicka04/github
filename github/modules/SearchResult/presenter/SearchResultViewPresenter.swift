//
//  SearchResultViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class SearchResultViewPresenter {
    
    private weak var view: SearchResultView?
    private let router: SearchResultWireframe
    private let interactor: GitHubUsecase
    
    private var keyword: String? {
        didSet {
            guard let keyword = keyword else { return }
            
            interactor.searchRepositories(from: keyword) { result in
                switch result {
                case .success(let repositories):
                    self.repositories = repositories
                case .failure(let error):
                    debugPrint(error)
                    self.view?.showSearchErrorAlert()
                }
            }
        }
    }
    
    private var repositories: [Repository] = [] {
        didSet {
            view?.updateSearchResults(repositories)
        }
    }
    
    init(view: SearchResultView, router: SearchResultWireframe, interactor: GitHubUsecase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension SearchResultViewPresenter: SearchResultViewPresentation {
    
    func viewDidLoad() {
        
    }
    
    func searchBarSearchButtonClicked(text: String) {
        self.keyword = text
    }
    
    func refreshControlDidRefresh(text: String) {
        self.keyword = text
    }
}
