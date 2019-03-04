//
//  RepositoryReleaseRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryReleaseRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryReleaseViewController()
        let router = RepositoryReleaseRouter(viewController: view)
        let interactor = GitHubReleaseInteractor(repository: repository)
        let presenter = RepositoryReleaseViewPresenter(view: view,
                                                       router: router,
                                                       interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryReleaseRouter: RepositoryReleaseWireframe {
    
}
