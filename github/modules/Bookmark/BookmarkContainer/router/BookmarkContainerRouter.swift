//
//  BookmarkContainerRouter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol BookmarkContainerWireframe: AnyObject {
    
    func showBookmarkView(at index: Int)
}

final class BookmarkContainerRouter {
    
    private unowned let pageViewController: UIPageViewController
    
    private let views = [
        RepositoryBookmarkRouter.assembleModules()
    ]
    
    private init(pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
    }

    static func assembleModules() -> UIViewController {
        let view = BookmarkContainerViewController()
        let router = BookmarkContainerRouter(pageViewController: view)
        let presenter = BookmarkContainerViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension BookmarkContainerRouter: BookmarkContainerWireframe {
    
    func showBookmarkView(at index: Int) {
        pageViewController.setViewControllers([views[index]], direction: .forward, animated: true, completion: nil)
    }
}
