//
//  RepositoryReleaseRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryReleaseRouter {
    
    private unowned let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = RepositoryReleaseViewController()
        let router = RepositoryReleaseRouter(viewController: view)
        let presenter = RepositoryReleaseViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryReleaseRouter: RepositoryReleaseWireframe {
    
}
