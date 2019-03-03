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
    
    private let repository: Repository
    
    private var currentContent: RepositoryDetailContent? {
        didSet {
            guard let content = currentContent else {
                return
            }
            
            DispatchQueue.main.async {
                self.pageViewController.setViewControllers([content.contentView(repository: self.repository)],
                                                           direction: .forward,
                                                           animated: false,
                                                           completion: nil)
            }
        }
    }
    
    private init(pageViewController: UIPageViewController,
                 repository: Repository) {
        self.pageViewController = pageViewController
        self.repository = repository
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryDetailPageViewController()
        let router = RepositoryDetailPageRouter(pageViewController: view, repository: repository)
        let presenter = RepositoryDetailPageViewPresenter(view: view, router: router, repository: repository)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryDetailPageRouter: RepositoryDetailPageWireframe {
    
    func showDetailContent(_ content: RepositoryDetailContent) {
        currentContent = content
    }
}

private extension RepositoryDetailContent {
    
    func contentView(repository: Repository) -> UIViewController {
        switch self {
        case .readme:
            return RepositoryReadmeRouter.assembleModules(repository: repository)
        case .contents:
            return RepositoryContentsRouter.assembelModules(repository: repository)
        case .release:
            return RepositoryReleaseRouter.assembleModules(repository: repository)
        }
    }
}
