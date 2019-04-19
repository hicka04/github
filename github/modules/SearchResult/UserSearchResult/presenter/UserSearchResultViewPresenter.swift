//
//  UserSearchResultViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import data
import entity

protocol UserSearchResultViewPresentation: SearchResultViewPresentation {
    
}


final class UserSearchResultViewPresenter<View: UserSearchResultView> {

    private weak var view: View?
    private let router: UserSearchResultWireframe
    private let userInteractor: GithubUserUsecase
    private let historyInteractor: SearchOptionsHistoryUsecase
    
    private var latestSearchOptions: SearchOptions? {
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
        guard let latestSearchOptions = latestSearchOptions else { return }
        
        userInteractor.searchUsers(from: latestSearchOptions.keyword,
                                   language: latestSearchOptions.language) { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                debugPrint(error)
                self?.view?.showSearchErrorAlert()
            }
        }
    }
}

extension UserSearchResultViewPresenter: UserSearchResultViewPresentation {
    
    func viewDidLoad() {
        historyInteractor.observe { [weak self] lastSearchOptions in
            self?.latestSearchOptions = lastSearchOptions
        }
    }
    
    func refreshControlDidRefresh() {
        searchUsers()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        router.showUserDetailView(user: users[indexPath.row])
    }
}

