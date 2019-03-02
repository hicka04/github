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
    
    static func assembelModules(repository: Repository, sha: SHA, path: String? = nil) -> UIViewController {
        let view = RepositoryTreeViewController(path: path)
        let router = RepositoryTreeRouter(viewController: view)
        let interactor = GitHubTreesInteractor()
        let presenter = RepositoryTreeViewPresenter(view: view,
                                                    router: router,
                                                    interactor: interactor,
                                                    repository: repository,
                                                    sha: sha)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryTreeRouter: RepositoryTreeWireframe {
    
    func showTreeView(from repository: Repository, sha: SHA, path: String) {
        let treeView = RepositoryTreeRouter.assembelModules(repository: repository, sha: sha, path: path)
        viewController.navigationController?.pushViewController(treeView, animated: true)
    }
}
