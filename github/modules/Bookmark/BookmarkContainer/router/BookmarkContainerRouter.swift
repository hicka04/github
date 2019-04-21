//
//  BookmarkContainerRouter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol BookmarkContainerWireframe: AnyObject {
    
}

final class BookmarkContainerRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = BookmarkContainerViewController()
        let router = BookmarkContainerRouter(viewController: view)
        let presenter = BookmarkContainerViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension BookmarkContainerRouter: BookmarkContainerWireframe {
    
}
