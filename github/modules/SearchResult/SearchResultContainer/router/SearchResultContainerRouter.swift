//
//  SearchResultContainerRouter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol SearchResultContainerWireframe: AnyObject {
    
}

final class SearchResultContainerRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = SearchResultContainerViewController()
        let router = SearchResultContainerRouter(viewController: view)
        let interactor = SearchOptionsHistoryInteractor()
        let presenter = SearchResultContainerViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension SearchResultContainerRouter: SearchResultContainerWireframe {
    
}
