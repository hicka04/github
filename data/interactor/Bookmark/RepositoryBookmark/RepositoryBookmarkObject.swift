//
//  RepositoryBookmarkObject.swift
//  data
//
//  Created by hicka04 on 2019/04/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift
import entity

class RepositoryBookmarkObject: Object, BookmarkObject {
    
    typealias Entity = Repository
    
    var id: String = ""
    var entity: Data = .init()
    var bookmarkedAt: Date = .init()

    override class func primaryKey() -> String? {
        return "id"
    }
}
