//
//  RepositoryReadmeRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import data
import entity

final class RepositoryReadmeRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(repository: Repository, branch: String? = nil) -> UIViewController {
        let view = RepositoryReadmeViewController()
        let router = RepositoryReadmeRouter(viewController: view)
        let interactor = GitHubReadmeInteractor(repository: repository)
        let presenter = RepositoryReadmeViewPresenter(view: view,
                                                      router: router,
                                                      interactor: interactor,
                                                      branch: branch)
        
        view.presenter = presenter
        
        return view
    }
}
