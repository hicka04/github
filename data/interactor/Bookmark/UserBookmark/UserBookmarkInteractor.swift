//
//  UserBookmarkInteractor.swift
//  data
//
//  Created by hicka04 on 2019/04/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift
import entity

extension User: Bookmarkable {}

public protocol UserBookmarkUsecase: BookmarkUsecase where BookmarkableEntity == User {}

public final class UserBookmarkInteractor {
    
    private let realm: Realm
    
    public init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension UserBookmarkInteractor: UserBookmarkUsecase {
    
    public func add(_ object: User) {
        
    }
    
    public func delete(_ object: User) {
        
    }
    
    public func contains(_ object: User) -> Bool {
        return true
    }
    
    public func observe(handler: ([User]) -> Void) {
        
    }
}
