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
    
    private let repository: Repository
    private var segmentedIndex: Int = -1 {
        didSet {
            guard let page = RepositoryDetailPage(rawValue: segmentedIndex) else {
                return
            }
            
            view?.setSegmentedIndex(segmentedIndex)
            router.showDetailPage(page)
        }
    }
    
    init(view: RepositoryDetailPageView,
         router: RepositoryDetailPageWireframe,
         repository: Repository) {
        self.view = view
        self.router = router
        
        self.repository = repository
    }
}

extension RepositoryDetailPageViewPresenter: RepositoryDetailPageViewPresentation {
    
    func viewDidLoad() {
        segmentedIndex = 0
    }
    
    func selectedSegmentIndexChanged(_ index: Int) {
        segmentedIndex = index
    }
    
    func pageViewDidFinishLoadPage(_ index: Int) {
        segmentedIndex = index
    }
}
