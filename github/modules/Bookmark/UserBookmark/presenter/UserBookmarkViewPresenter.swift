//
//  UserBookmarkViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/4/24.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import data
import entity

protocol UserBookmarkViewPresentation: AnyObject {

    func viewDidLoad()    
}

final class UserBookmarkViewPresenter<View: UserBookmarkView,
                                      BookmarkUsecase: UserBookmarkUsecase> {

    private weak var view: View?
    private let router: UserBookmarkWireframe
    private let interactor: BookmarkUsecase
    
    private var users: [User] = [] {
        didSet {
            view?.update(users)
        }
    }
    
    init(view: View,
         router: UserBookmarkWireframe,
         interactor: BookmarkUsecase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension UserBookmarkViewPresenter: UserBookmarkViewPresentation {
    
    func viewDidLoad() {
        interactor.observe { users in
            self.users = users
        }
    }
}

