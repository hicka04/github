//
//  RepositoryCodeRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryContentsRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembelModules(repository: Repository, sha: SHA, path: String? = nil) -> UIViewController {
        let view = RepositoryContentsViewController(path: path)
        let router = RepositoryContentsRouter(viewController: view)
        let interactor = GitHubRepositoryContentsInteractor()
        let presenter = RepositoryContentsViewPresenter(view: view,
                                                    router: router,
                                                    interactor: interactor,
                                                    repository: repository,
                                                    sha: sha)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryContentsRouter: RepositoryContentsWireframe {
    
    func showTreeView(from repository: Repository, sha: SHA, path: String) {
        let treeView = RepositoryContentsRouter.assembelModules(repository: repository, sha: sha, path: path)
        viewController.navigationController?.pushViewController(treeView, animated: true)
    }
}
