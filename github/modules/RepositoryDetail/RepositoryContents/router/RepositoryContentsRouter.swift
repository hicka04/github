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
    
    private let repository: Repository
    
    private init(viewController: UIViewController,
                 repository: Repository) {
        self.viewController = viewController
        self.repository = repository
    }
    
    static func assembelModules(repository: Repository,
                                path: String = "",
                                name: String? = nil,
                                branch: String? = nil) -> UIViewController {
        let view = RepositoryContentsViewController(name: name)
        let router = RepositoryContentsRouter(viewController: view, repository: repository)
        let interactor = GitHubRepositoryContentsInteractor(repository: repository, path: path)
        let presenter = RepositoryContentsViewPresenter(view: view,
                                                        router: router,
                                                        interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryContentsRouter: RepositoryContentsWireframe {
    
    func showRepositoryContentsView(_ content: RepositoryContent, branch: String?) {
        let repositoryContentsView = RepositoryContentsRouter.assembelModules(repository: repository,
                                                                              path: content.path,
                                                                              name: content.name,
                                                                              branch: branch)
        viewController.navigationController?.pushViewController(repositoryContentsView, animated: true)
    }
}
