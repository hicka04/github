//
//  UserSearchResultViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol UserSearchResultViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class UserSearchResultViewPresenter {

    private weak var view: UserSearchResultView?
    private let router: UserSearchResultWireframe
    private let interactor: GithubUserUsecase
    
    init(view: UserSearchResultView,
         router: UserSearchResultWireframe,
         interactor: GithubUserUsecase) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension UserSearchResultViewPresenter: UserSearchResultViewPresentation {
    
    func viewDidLoad() {
        
    }
}

