//
//  UserBookmarkRouter.swift
//  github
//
//  Created by hikaru on 2019/4/24.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import data

protocol UserBookmarkWireframe: AnyObject {
    
}

final class UserBookmarkRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = UserBookmarkViewController()
        let router = UserBookmarkRouter(viewController: view)
        let interactor = UserBookmarkInteractor()
        let presenter = UserBookmarkViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension UserBookmarkRouter: UserBookmarkWireframe {
    
}
