//
//  RepositorySearchResultRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import FloatingPanel

protocol RepositorySearchResultWireframe: AnyObject {
    
    func showRepositoryDetailView(repository: Repository)
}

final class RepositorySearchResultRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = RepositorySearchResultViewController()
        let router = RepositorySearchResultRouter(viewController: view)
        let repositoryInteractor = GitHubRepositoryInteractor()
        let historyInteractor = SearchOptionsHistoryInteractor()
        let presenter = RepositorySearchResultViewPresenter(view: view,
                                                            router: router,
                                                            repositoryInteractor: repositoryInteractor,
                                                            historyInteractor: historyInteractor)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositorySearchResultRouter: RepositorySearchResultWireframe {
    
    func showRepositoryDetailView(repository: Repository) {
        let repositoryDetailView = RepositoryDetailPageRouter.assembleModules(repository: repository)
        viewController.navigationController?.pushViewController(repositoryDetailView, animated: true)
    }
}
