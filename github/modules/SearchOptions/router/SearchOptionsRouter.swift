//
//  SearchOptionsRouter.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import FloatingPanel
import data

protocol SearchOptionsWireframe: AnyObject {
    
    func moveToTip()
    func moveToHalf()
    func moveToFull()
}

final class SearchOptionsRouter {
    
    private unowned let viewController: UIViewController
    private unowned let floatingPanelController: FloatingPanelController
    
    private init(viewController: UIViewController,
                 floatingPanelController: FloatingPanelController) {
        self.viewController = viewController
        self.floatingPanelController = floatingPanelController
    }

    static func assembleModules(floatingPanelController: FloatingPanelController) -> UIViewController {
        let view = SearchOptionsViewController()
        let router = SearchOptionsRouter(viewController: view,
                                         floatingPanelController: floatingPanelController)
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
    
    func moveToTip() {
        floatingPanelController.move(to: .tip, animated: true)
    }
    
    func moveToHalf() {
        floatingPanelController.move(to: .half, animated: true)
    }
    
    func moveToFull() {
        floatingPanelController.move(to: .full, animated: true)
    }
}
