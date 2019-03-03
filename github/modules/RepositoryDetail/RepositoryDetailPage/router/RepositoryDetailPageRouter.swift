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
        let interactor = GitHubBranchInteractor()
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

private extension RepositoryDetailContent {
    
    var contentView: UIViewController {
        switch self {
        case .readme(let repository):
            return RepositoryReadmeRouter.assembleModules(repository: repository)
        case .tree(let repository, let sha):
            return RepositoryContentsRouter.assembelModules(repository: repository, sha: sha)
        case .release(let repository):
            return RepositoryReleaseRouter.assembleModules(repository: repository)
        }
    }
}
