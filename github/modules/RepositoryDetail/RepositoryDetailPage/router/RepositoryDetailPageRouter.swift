//
//  RepositoryDetailRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryDetailPageRouter {
    
    private unowned let pageViewController: UIPageViewController
    
    private init(pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryDetailPageViewController()
        let router = RepositoryDetailPageRouter(pageViewController: view)
        let presenter = RepositoryDetailPageViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryDetailPageRouter: RepositoryDetailPageWireframe {
    
    func showFirstView() {
        show(content: .readme)
    }
    
    func show(content: RepositoryDetailContent,
              from beforeContent: RepositoryDetailContent? = nil) {
        
        let contentView: UIViewController
        switch content {
        case .readme:
            contentView = RepositoryReadmeRouter.assembleModules()
        case .code:
            contentView = RepositoryCodeRouter.assembelModules()
        default:
            fatalError()
        }
        
        let direction: UIPageViewController.NavigationDirection
            = (beforeContent?.rawValue ?? -1 < content.rawValue) ? .forward : .reverse
        pageViewController.setViewControllers([contentView], direction: direction, animated: true, completion: nil)
    }
}
