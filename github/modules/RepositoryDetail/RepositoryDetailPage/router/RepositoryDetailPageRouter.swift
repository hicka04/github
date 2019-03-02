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
    
    private var currentContent: RepositoryDetailContent? {
        didSet {
            guard let content = currentContent else {
                return
            }
            
            DispatchQueue.main.async {
                self.pageViewController.setViewControllers([content.contentView],
                                                           direction: .forward,
                                                           animated: false,
                                                           completion: nil)
            }
        }
    }
    
    private init(pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
    }
    
    static func assembleModules(repository: Repository) -> UIViewController {
        let view = RepositoryDetailPageViewController()
        let router = RepositoryDetailPageRouter(pageViewController: view)
        let interactor = GitHubInteractor()
        let presenter = RepositoryDetailPageViewPresenter(view: view, router: router, interactor: interactor, repository: repository)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryDetailPageRouter: RepositoryDetailPageWireframe {
    
    func show(content: RepositoryDetailContent) {
        currentContent = content
    }
}

extension RepositoryDetailContent {
    
    var contentView: UIViewController {
        switch self {
        case .readme:
            return RepositoryReadmeRouter.assembleModules()
        case .code(let repository, let branch):
            return RepositoryCodeRouter.assembelModules(repository: repository, branch: branch)
        case .release:
            return RepositoryReleaseRouter.assembleModules()
        }
    }
}
