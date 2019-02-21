//
//  RepositoryDetailRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryDetailRouter {
    
    private unowned let pageViewController: UIPageViewController
    
    private init(pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryDetailViewController()
        let router = RepositoryDetailRouter(pageViewController: view)
        let presenter = RepositoryDetailViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryDetailRouter: RepositoryDetailWireframe {
    
    func showFirstView() {
        show(content: .readme)
    }
    
    func show(content: RepositoryDetailContent,
              from beforeContent: RepositoryDetailContent? = nil) {
        
        let contentView: UIViewController
        switch content {
        case .readme:
            contentView = RepositoryReadmeRouter.assembleModules()
        default:
            fatalError()
        }
        
        let direction: UIPageViewController.NavigationDirection
            = (beforeContent?.rawValue ?? -1 < content.rawValue) ? .forward : .reverse
        pageViewController.setViewControllers([contentView], direction: direction, animated: true, completion: nil)
    }
}
