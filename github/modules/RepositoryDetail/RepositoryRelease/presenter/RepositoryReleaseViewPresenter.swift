//
//  RepositoryReleaseViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryReleaseViewPresenter {
    
    private weak var view: RepositoryReleaseView?
    private let router: RepositoryReleaseWireframe
    
    init(view: RepositoryReleaseView, router: RepositoryReleaseWireframe) {
        self.view = view
        self.router = router
    }
}

extension RepositoryReleaseViewPresenter: RepositoryReleaseViewPresentation {
    
    func viewDidLoad() {
        
    }
}
