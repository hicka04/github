//
//  RepositoryCodeRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryTreeRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembelModules(repository: Repository, branch: Branch) -> UIViewController {
        let view = RepositoryTreeViewController()
        let router = RepositoryTreeRouter(viewController: view)
        let interactor = GitHubInteractor()
        let presenter = RepositoryTreeViewPresenter(view: view,
                                                    router: router,
                                                    interactor: interactor,
                                                    repository: repository,
                                                    branch: branch)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryTreeRouter: RepositoryTreeWireframe {
    
}
