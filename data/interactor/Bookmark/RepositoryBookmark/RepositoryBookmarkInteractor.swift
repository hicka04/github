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

public protocol RepositoryBookmarkUsecase: BookmarkUsecase where Entity == Repository {}

public final class RepositoryBookmarkInteractor {
    
    private let realm: Realm
    
    private var notificationToken: NotificationToken?
    
    public init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension RepositoryBookmarkInteractor: RepositoryBookmarkUsecase {
    
    public func add(_ entity: Repository) {
        guard let object = try? RepositoryBookmarkObject(entity: entity) else { return }
        try! realm.write {
            realm.add(object)
        }
    }
    
    public func delete(_ entity: Repository) {
        guard let object = realm.object(ofType: RepositoryBookmarkObject.self,
                                        forPrimaryKey: "\(entity.id)") else { return }
        try! realm.write {
            realm.delete(object)
        }
    }
    
    public func contains(_ entity: Repository) -> Bool {
        return realm.object(ofType: RepositoryBookmarkObject.self, forPrimaryKey: "\(entity.id)") != nil
    }
    
    public func observe(handler: @escaping ([Repository]) -> Void) {
        notificationToken = realm.objects(RepositoryBookmarkObject.self).observe { change in
            switch change {
            case .initial(let bookmarks),
                 .update(let bookmarks, _, _, _):
                handler(Array(bookmarks.compactMap { try? $0.convertToEntity() }))
            case .error:
                break
            }
        }
    }
}
