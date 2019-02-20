//
//  SearchResultViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class SearchResultViewPresenter {
    
    private weak var view: SearchResultView?
    private let router: SearchResultWireframe
    
    init(view: SearchResultView, router: SearchResultWireframe) {
        self.view = view
        self.router = router
    }
}

extension SearchResultViewPresenter: SearchResultViewPresentation {
    
    func viewDidLoad() {
        
    }
}
