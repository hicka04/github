//
//  RepositoryDetailViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryDetailPageViewPresenter {
    
    private weak var view: RepositoryDetailPageView?
    private let router: RepositoryDetailPageWireframe
    
    init(view: RepositoryDetailPageView, router: RepositoryDetailPageWireframe) {
        self.view = view
        self.router = router
    }
}

extension RepositoryDetailPageViewPresenter: RepositoryDetailPageViewPresentation {
    
    func viewDidLoad() {
        router.showFirstView()
    }
    
    func selectedSegmentIndexChanged(_ index: Int) {
        guard let content = RepositoryDetailContent(rawValue: index) else {
            return
        }
        
        router.show(content: content, from: nil)
    }
}
