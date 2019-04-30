//
//  BookmarkContract.swift
//  github
//
//  Created by hicka04 on 2019/04/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol BookmarkView: PageViewContentView {
    
    associatedtype BookmarkEntity
    
    func update(_ entities: [BookmarkEntity])
}

extension RepositoryBookmarkView {
    
    var index: Int {
        return 0
    }
}

extension UserBookmarkView {
    
    var index: Int {
        return 1
    }
}
