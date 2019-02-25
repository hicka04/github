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
    
    private var currentContent: RepositoryDetailContent = .readme {
        didSet {
            pageViewController.setViewControllers([currentContent.contentView],
                                                  direction: currentContent.direction(from: oldValue),
                                                  animated: true,
                                                  completion: nil)
        }
    }
    
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
    
    func showFirstContentView() {
        currentContent = .readme
    }
    
    func showContentView(for index: Int) {
        guard let content = RepositoryDetailContent(rawValue: index) else {
            return
        }
        
        currentContent = content
    }
}

private extension RepositoryDetailContent {
    
    var contentView: UIViewController {
        switch self {
        case .readme:  return RepositoryReadmeRouter.assembleModules()
        case .code:    return RepositoryCodeRouter.assembelModules()
        case .release: return RepositoryReleaseRouter.assembleModules()
        }
    }
    
    func direction(from beforeContent: RepositoryDetailContent) -> UIPageViewController.NavigationDirection {
        return beforeContent.rawValue < self.rawValue ? .forward : .reverse
    }
}
