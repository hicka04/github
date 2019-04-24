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


final class RepositoryBookmarkViewPresenter<View: RepositoryBookmarkView,
                                            BookmarkUsecase: RepositoryBookmarkUsecase> {

    private weak var view: View?
    private let router: RepositoryBookmarkWireframe
    private let interactor: BookmarkUsecase
    
    private var repositories: [Repository] = [] {
        didSet {
            view?.update(repositories)
        }
    }
    
    init(view: View,
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

