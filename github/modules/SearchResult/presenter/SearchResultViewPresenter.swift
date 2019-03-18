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
    private let repositoryInteractor: GitHubRepositoryUsecase
    private let historyInteractor: SearchOptionsHistoryUsecase
    
    private var keyword: String? {
        didSet {
            view?.scrollToTop()
            searchRepositories()
        }
    }
    
    private var repositories: [Repository] = [] {
        didSet {
            view?.updateSearchResults(repositories)
        }
    }
    
    init(view: SearchResultView,
         router: SearchResultWireframe,
         repositoryInteractor: GitHubRepositoryUsecase,
         historyInteractor: SearchOptionsHistoryUsecase) {
        self.view = view
        self.router = router
        self.repositoryInteractor = repositoryInteractor
        self.historyInteractor = historyInteractor
    }
    
    private func searchRepositories() {
        guard let keyword = keyword else { return }
        
        repositoryInteractor.searchRepositories(from: keyword) { [weak self] result in
            switch result {
            case .success(let repositories):
                self?.repositories = repositories
            case .failure(let error):
                debugPrint(error)
                self?.view?.showSearchErrorAlert()
            }
        }
    }
}

extension SearchResultViewPresenter: SearchResultViewPresentation {
    
    func viewDidLoad() {
        historyInteractor.observe { [weak self] lastSearchOptions in
            self?.keyword = lastSearchOptions?.keyword
        }
        router.showSearchOptionsView()
    }
    
    func refreshControlDidRefresh() {
        searchRepositories()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        router.showRepositoryDetailView(repository: repositories[indexPath.row])
    }
}
