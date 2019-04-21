//
//  BookmarkRouter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol BookmarkWireframe: AnyObject {
    
}

final class BookmarkRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = BookmarkViewController()
        let router = BookmarkRouter(viewController: view)
        let presenter = BookmarkViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension BookmarkRouter: BookmarkWireframe {
    
}
