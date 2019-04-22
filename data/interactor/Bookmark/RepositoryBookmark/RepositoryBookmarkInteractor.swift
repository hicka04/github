//
//  RepositoryBookmarkInteractor.swift
//  data
//
//  Created by hicka04 on 2019/04/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift
import entity

extension Repository: Bookmarkable {}

public protocol RepositoryBookmarkUsecase: BookmarkUsecase where BookmarkableEntity == Repository {}

public final class RepositoryBookmarkInteractor {
    
    private let realm: Realm
    
    public init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension RepositoryBookmarkInteractor: RepositoryBookmarkUsecase {
    
    public func add(_ object: Repository) {
        
    }
    
    public func delete(_ object: Repository) {
        
    }
    
    public func contains(_ object: Repository) -> Bool {
        return true
    }
    
    public func observe(handler: ([Repository]) -> Void) {
        
    }
}
