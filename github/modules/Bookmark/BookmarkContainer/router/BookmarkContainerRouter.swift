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

final class BookmarkContainerRouter: NSObject {
    
    private unowned let pageViewController: UIPageViewController
    
    private let views = [
        RepositoryBookmarkRouter.assembleModules(),
        UserBookmarkRouter.assembleModules()
    ]
    
    private init(pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
        super.init()
        pageViewController.dataSource = self
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

extension BookmarkContainerRouter: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = views.firstIndex(of: viewController),
            index > 0 else {
            return nil
        }
        
        return views[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = views.firstIndex(of: viewController),
            index + 1 < views.count else {
            return nil
        }
        
        return views[index + 1]
    }
}
