//
//  RepositoryContentListRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryContentListRouter {
    
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
        let view = RepositoryContentListViewController(name: name)
        let router = RepositoryContentListRouter(viewController: view, repository: repository)
        let interactor = GitHubRepositoryContentsInteractor(repository: repository, path: path)
        let presenter = RepositoryContentListViewPresenter(view: view,
                                                        router: router,
                                                        interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryContentListRouter: RepositoryContentListWireframe {
    
    func showRepositoryContentListView(_ content: RepositoryContent, branch: String?) {
        let repositoryContentListView = RepositoryContentListRouter.assembelModules(repository: repository,
                                                                                    path: content.path,
                                                                                    name: content.name,
                                                                                    branch: branch)
        viewController.navigationController?.pushViewController(repositoryContentListView, animated: true)
    }
    
    func showRepositoryContentView(_ content: RepositoryContent, branch: String?) {
        let repositoryContentView = RepositoryContentRouter.assembleModules(url: content.htmlUrl)
        viewController.navigationController?.pushViewController(repositoryContentView, animated: true)
    }
}
