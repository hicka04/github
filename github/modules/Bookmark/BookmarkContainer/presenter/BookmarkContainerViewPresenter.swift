//
//  BookmarkContainerViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol BookmarkContainerViewPresentation: AnyObject {

    func viewDidLoad()
    func selectedSegmentIndexChanged(_ index: Int)
}

final class BookmarkContainerViewPresenter {

    private weak var view: BookmarkContainerView?
    private let router: BookmarkContainerWireframe
    
    init(view: BookmarkContainerView,
         router: BookmarkContainerWireframe) {
        self.view = view
        self.router = router
    }
}

extension BookmarkContainerViewPresenter: BookmarkContainerViewPresentation {
    
    func viewDidLoad() {
        router.showBookmarkView(at: 0)
    }
    
    func selectedSegmentIndexChanged(_ index: Int) {
        router.showBookmarkView(at: index)
    }
}

