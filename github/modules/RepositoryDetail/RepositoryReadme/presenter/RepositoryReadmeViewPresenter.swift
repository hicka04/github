//
//  RepositoryReadmeViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryReadmeViewPresenter {
    
    private weak var view: RepositoryReadmeView?
    private let router: RepositoryReadmeRouter
    
    init(view: RepositoryReadmeView, router: RepositoryReadmeRouter) {
        self.view = view
        self.router = router
    }
}

extension RepositoryReadmeViewPresenter: RepositoryReadmeViewPresentation {
    
    func viewDidLoad() {
        
    }
}
