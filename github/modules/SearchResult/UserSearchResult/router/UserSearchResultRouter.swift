//
//  UserSearchResultRouter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol UserSearchResultWireframe: AnyObject {
    
}

final class UserSearchResultRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = UserSearchResultViewController()
        let router = UserSearchResultRouter(viewController: view)
        let userInteractor = GithubUserInteractor()
        let historyInteractor = SearchOptionsHistoryInteractor()
        let presenter = UserSearchResultViewPresenter(view: view,
                                                      router: router,
                                                      userInteractor: userInteractor,
                                                      historyInteractor: historyInteractor)
        
        view.presenter = presenter
        
        return view
    }
}

extension UserSearchResultRouter: UserSearchResultWireframe {
    
}
