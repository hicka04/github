//
//  TabViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol TabViewPresentation: AnyObject {

}


final class TabViewPresenter {

    private weak var view: TabView?
    private let router: TabWireframe
    
    init(view: TabView,
         router: TabWireframe) {
        self.view = view
        self.router = router
    }
}

extension TabViewPresenter: TabViewPresentation {
    
}

