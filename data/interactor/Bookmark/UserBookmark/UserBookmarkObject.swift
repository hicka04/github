//
//  UserBookmarkObject.swift
//  data
//
//  Created by hicka04 on 2019/04/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift
import entity

@objcMembers
class UserBookmarkObject: Object, BookmarkObject {
    
    typealias Entity = User
    
    dynamic var id: String = ""
    dynamic var entity: Data = .init()
    dynamic var bookmarkedAt: Date = .init()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
