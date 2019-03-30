//
//  RepositoryDetailRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import entity

final class RepositoryDetailPageRouter: NSObject {
    
    private unowned let pageViewController: UIPageViewController
    
    private let repository: Repository
    
    private let pages: [UIViewController]
    
    private var currentPage: RepositoryDetailPage? {
        didSet {
            guard let page = currentPage else {
                return
            }
            
            DispatchQueue.main.async {
                self.pageViewController.setViewControllers([self.pages[page.rawValue]],
                                                           direction: page.direction(from: oldValue),
                                                           animated: true,
                                                           completion: nil)
            }
        }
    }
    
    private init(pageViewController: UIPageViewController,
                 repository: Repository) {
        self.pageViewController = pageViewController
        self.repository = repository
        
        self.pages = [
            RepositoryReadmeRouter.assembleModules(repository: repository),
            RepositoryContentListRouter.assembelModules(repository: repository),
            RepositoryReleaseRouter.assembleModules(repository: repository)
        ]
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryDetailPageViewController()
        let router = RepositoryDetailPageRouter(pageViewController: view, repository: repository)
        let presenter = RepositoryDetailPageViewPresenter(view: view, router: router, repository: repository)
        
        view.presenter = presenter
        
        view.dataSource = router
        
        
        return view
    }
}

extension RepositoryDetailPageRouter: RepositoryDetailPageWireframe {
    
    func showDetailPage(_ page: RepositoryDetailPage) {
        currentPage = page
    }
}

extension RepositoryDetailPageRouter: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentView = viewController as? RepositoryDetailPageContentView,
            contentView.index > 0 else {
                return nil
        }
        
        return pages[contentView.index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentView = viewController as? RepositoryDetailPageContentView,
            contentView.index < pages.count - 1 else {
                return nil
        }
        
        return pages[contentView.index + 1]
    }
}

private extension RepositoryDetailPage {
    
    func direction(from previousPage: RepositoryDetailPage?) -> UIPageViewController.NavigationDirection {
        return previousPage?.rawValue ?? -1 < self.rawValue ? .forward : .reverse
    }
}
