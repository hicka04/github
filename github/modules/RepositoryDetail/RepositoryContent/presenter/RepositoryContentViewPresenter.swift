//
//  RepositoryContentViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/03/09.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryContentViewPresenter {
    
    private weak var view: RepositoryContentView?
    private let router: RepositoryContentWireframe
    
    init(view: RepositoryContentView, router: RepositoryContentWireframe) {
        self.view = view
        self.router = router
    }
}

extension RepositoryContentViewPresenter: RepositoryContentViewPresentation {
    
}
