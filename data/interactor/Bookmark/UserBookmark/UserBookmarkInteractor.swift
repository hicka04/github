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

public protocol UserBookmarkUsecase: BookmarkUsecase where Entity == User {}

public final class UserBookmarkInteractor {
    
    private let realm: Realm
    
    private var notificationToken: NotificationToken?
    
    public init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension UserBookmarkInteractor: UserBookmarkUsecase {
    
    public func add(_ entity: User) {
        guard let object = try? UserBookmarkObject(entity: entity) else { return }
        try! realm.write {
            realm.add(object)
        }
    }
    
    public func delete(_ entity: User) {
        guard let object = realm.object(ofType: UserBookmarkObject.self,
                                        forPrimaryKey: "\(entity.id)") else { return }
        try! realm.write {
            realm.delete(object)
        }
    }
    
    public func contains(_ entity: User) -> Bool {
        return realm.object(ofType: UserBookmarkObject.self, forPrimaryKey: "\(entity.id)") != nil
    }
    
    public func observe(handler: @escaping ([User]) -> Void) {
        notificationToken = realm.objects(UserBookmarkObject.self).observe { change in
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
