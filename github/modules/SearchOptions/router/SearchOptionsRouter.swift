//
//  SearchOptionsRouter.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import FloatingPanel

protocol SearchOptionsWireframe: AnyObject {
    
}

final class SearchOptionsRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules(floatingPanelController: FloatingPanelController) -> UIViewController {
        let view = SearchOptionsViewController()
        let router = SearchOptionsRouter(viewController: view)
        let historyInteractor = SearchOptionsHistoryInteractor()
        let presenter = SearchOptionsViewPresenter(view: view,
                                                   router: router,
                                                   historyInteractor: historyInteractor)
        
        view.presenter = presenter
        
        floatingPanelController.delegate = view
        
        return view
    }
}

extension SearchOptionsRouter: SearchOptionsWireframe {
    
}
