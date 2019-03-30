//
//  RootRouter.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RootRouter {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showFirstView() {
        let searchResultView = UINavigationController(rootViewController: SearchResultContainerRouter.assembleModules())
        window.rootViewController = searchResultView
        window.makeKeyAndVisible()
    }
}
