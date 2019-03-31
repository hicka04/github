//
//  UserDetailViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/23.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import entity

protocol UserDetailViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class UserDetailViewPresenter {

    private weak var view: UserDetailView?
    private let router: UserDetailWireframe
    
    private let user: User
    
    init(view: UserDetailView,
         router: UserDetailWireframe,
         user: User) {
        self.view = view
        self.router = router
        self.user = user
    }
}

extension UserDetailViewPresenter: UserDetailViewPresentation {
    
    func viewDidLoad() {
        view?.load(user.htmlUrl)
    }
}

