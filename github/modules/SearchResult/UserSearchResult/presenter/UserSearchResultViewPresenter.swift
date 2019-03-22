//
//  UserSearchResultViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol UserSearchResultViewPresentation: SearchResultViewPresentation {
    
}


final class UserSearchResultViewPresenter<View: UserSearchResultView> {

    private weak var view: View?
    private let router: UserSearchResultWireframe
    private let userInteractor: GithubUserUsecase
    private let historyInteractor: SearchOptionsHistoryUsecase
    
    private var keyword: String? {
        didSet {
            view?.scrollToTop()
            searchUsers()
        }
    }
    
    private var users: [User] = [] {
        didSet {
            view?.updateSearchResults(users)
        }
    }
    
    init(view: View,
         router: UserSearchResultWireframe,
         userInteractor: GithubUserUsecase,
         historyInteractor: SearchOptionsHistoryUsecase) {
        self.view = view
        self.router = router
        self.userInteractor = userInteractor
        self.historyInteractor = historyInteractor
    }
    
    private func searchUsers() {
        guard let keyword = keyword else { return }
        
        userInteractor.searchUsers(from: keyword) { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

extension UserSearchResultViewPresenter: UserSearchResultViewPresentation {
    
    func viewDidLoad() {
        historyInteractor.observe { [weak self] lastSearchOptions in
            self?.keyword = lastSearchOptions?.keyword
        }
    }
    
    func refreshControlDidRefresh() {
        searchUsers()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        
    }
}

