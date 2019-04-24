//
//  RepositoryBookmarkViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/4/24.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import data
import entity

protocol RepositoryBookmarkViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class RepositoryBookmarkViewPresenter<BookmarkUsecase: RepositoryBookmarkUsecase> {

    private weak var view: RepositoryBookmarkView?
    private let router: RepositoryBookmarkWireframe
    private let interactor: BookmarkUsecase
    
    private var repositories: [Repository] = [] {
        didSet {
            view?.update(repositories: repositories)
        }
    }
    
    init(view: RepositoryBookmarkView,
         router: RepositoryBookmarkWireframe,
         interactor: BookmarkUsecase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension RepositoryBookmarkViewPresenter: RepositoryBookmarkViewPresentation {
    
    func viewDidLoad() {
        interactor.observe { repositories in
            self.repositories = repositories
        }
    }
}

