//
//  SearchResultRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class SearchResultRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = SearchResultViewController()
        let router = SearchResultRouter(viewController: view)
        let interactor = GitHubInteractor()
        let presenter = SearchResultViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension SearchResultRouter: SearchResultWireframe {
    
    func showRepositoryDetailView() {
        
    }
}
