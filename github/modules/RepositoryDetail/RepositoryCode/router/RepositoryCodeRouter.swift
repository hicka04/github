//
//  RepositoryCodeRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryCodeRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembelModules() -> UIViewController {
        let view = RepositoryCodeViewController()
        let router = RepositoryCodeRouter(viewController: view)
        let presenter = RepositoryCodeViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension RepositoryCodeRouter: RepositoryCodeWireframe {
    
}
