//
//  SearchOptionsViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol SearchOptionsViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class SearchOptionsViewPresenter {

    private weak var view: SearchOptionsView?
    private let router: SearchOptionsWireframe
    
    init(view: SearchOptionsView,
         router: SearchOptionsWireframe) {
        self.view = view
        self.router = router
    }
}

extension SearchOptionsViewPresenter: SearchOptionsViewPresentation {
    
    func viewDidLoad() {
        
    }
}

