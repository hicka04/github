//
//  RepositoryBookmarkRouter.swift
//  github
//
//  Created by hikaru on 2019/4/24.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import data

protocol RepositoryBookmarkWireframe: AnyObject {
    
}

final class RepositoryBookmarkRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = RepositoryBookmarkViewController()
        let router = RepositoryBookmarkRouter(viewController: view)
        let interactor = RepositoryBookmarkInteractor()
        let presenter = RepositoryBookmarkViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryBookmarkRouter: RepositoryBookmarkWireframe {
    
}
