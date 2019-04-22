//
//  BookmarkContract.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import RealmSwift
import entity

public protocol Bookmarkable {}

public protocol BookmarkUsecase {
    
    associatedtype BookmarkableEntity: Bookmarkable
    
    func add(_ object: BookmarkableEntity)
    func delete(_ object: BookmarkableEntity)
    func contains(_ object: BookmarkableEntity) -> Bool
    func observe(handler: ([BookmarkableEntity]) -> Void)
}
