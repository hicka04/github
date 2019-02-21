//
//  RepositoryDetailRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryDetailRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryDetailViewController()
        let router = RepositoryDetailRouter(viewController: view)
        let presenter = RepositoryDetailViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryDetailRouter: RepositoryDetailWireframe {
    
}
