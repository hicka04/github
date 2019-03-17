//
//  SearchResultRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import FloatingPanel

final class SearchResultRouter {
    
    private unowned let viewController: UIViewController
    private let floatingPanelController: FloatingPanelController = {
        let floatingPanelController = FloatingPanelController()
        floatingPanelController.surfaceView.cornerRadius = 16
        return floatingPanelController
    }()
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = SearchResultViewController()
        let router = SearchResultRouter(viewController: view)
        let repositoryInteractor = GitHubRepositoryInteractor()
        let historyInteractor = SearchOptionsHistoryInteractor()
        let presenter = SearchResultViewPresenter(view: view,
                                                  router: router,
                                                  repositoryInteractor: repositoryInteractor,
                                                  historyInteractor: historyInteractor)
        
        view.presenter = presenter
        
        return view
    }
}

extension SearchResultRouter: SearchResultWireframe {
    
    func showSearchOptionsView() {
        let searchOptionsView = SearchOptionsRouter.assembleModules()
        floatingPanelController.set(contentViewController: searchOptionsView)
        floatingPanelController.addPanel(toParent: viewController)
        floatingPanelController.move(to: .tip, animated: false)
    }
    
    func showRepositoryDetailView(repository: Repository) {
        let repositoryDetailView = RepositoryDetailPageRouter.assembleModules(repository: repository)
        viewController.navigationController?.pushViewController(repositoryDetailView, animated: true)
    }
}
