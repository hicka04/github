//
//  TabRouter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol TabWireframe: AnyObject {
    
}

final class TabRouter {
    
    private unowned let viewController: UITabBarController
    
    private init(viewController: UITabBarController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = TabViewController()
        view.setViewControllers(createTabContents(), animated: false)
        let router = TabRouter(viewController: view)
        let presenter = TabViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
    private static func createTabContents() -> [UIViewController] {
        let searchResultView = UINavigationController(rootViewController: SearchResultContainerRouter.assembleModules())
        searchResultView.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return [searchResultView]
    }
}

extension TabRouter: TabWireframe {
    
}
