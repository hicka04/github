//
//  RepositoryContentRouter.swift
//  github
//
//  Created by hicka04 on 2019/03/09.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryContentRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(url: URL) -> UIViewController {
        let view = RepositoryContentViewController()
        let router = RepositoryContentRouter(viewController: view)
        let presenter = RepositoryContentViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryContentRouter: RepositoryContentWireframe {
    
}
