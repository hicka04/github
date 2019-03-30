//
//  UserDetailRouter.swift
//  github
//
//  Created by hikaru on 2019/3/23.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import entity

protocol UserDetailWireframe: AnyObject {
    
}

final class UserDetailRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules(user: User) -> UIViewController {
        let view = UserDetailViewController(userName: user.login)
        let router = UserDetailRouter(viewController: view)
        let presenter = UserDetailViewPresenter(view: view, router: router, user: user)
        
        view.presenter = presenter
        
        return view
    }
}

extension UserDetailRouter: UserDetailWireframe {
    
}
