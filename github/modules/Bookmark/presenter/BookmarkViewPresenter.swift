//
//  BookmarkViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol BookmarkViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class BookmarkViewPresenter {

    private weak var view: BookmarkView?
    private let router: BookmarkWireframe
    
    init(view: BookmarkView,
         router: BookmarkWireframe) {
        self.view = view
        self.router = router
    }
}

extension BookmarkViewPresenter: BookmarkViewPresentation {
    
    func viewDidLoad() {
        
    }
}

