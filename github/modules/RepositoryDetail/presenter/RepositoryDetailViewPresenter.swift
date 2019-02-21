//
//  RepositoryDetailViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryDetailViewPresenter {
    
    private weak var view: RepositoryDetailView?
    private let router: RepositoryDetailWireframe
    
    init(view: RepositoryDetailView, router: RepositoryDetailWireframe) {
        self.view = view
        self.router = router
    }
}

extension RepositoryDetailViewPresenter: RepositoryDetailViewPresentation {
    
    func viewDidLoad() {
        
    }
}
