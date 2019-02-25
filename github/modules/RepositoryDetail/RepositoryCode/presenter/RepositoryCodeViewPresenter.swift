//
//  RepositoryCodeViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryCodeViewPresenter {
    
    private weak var view: RepositoryCodeView?
    private let router: RepositoryCodeWireframe
    
    init(view: RepositoryCodeView, router: RepositoryCodeWireframe) {
        self.view = view
        self.router = router
    }
}

extension RepositoryCodeViewPresenter: RepositoryCodeViewPresentation {
    
    func viewDidLoad() {
        
    }
}
