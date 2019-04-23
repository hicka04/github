//
//  BookmarkObject.swift
//  data
//
//  Created by hicka04 on 2019/04/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift

public protocol BookmarkObject where Self: Object {
    
    associatedtype Entity: Bookmarkable
    
    var id: String { get set }
    var entity: Data { get set }
    var bookmarkedAt: Date { get set }
    
    init(entity: Entity) throws
}

extension BookmarkObject {
    
    init(entity: Entity) throws {
        self.init()
        self.id = "\(entity.id)"
        self.entity = try JSONEncoder().encode(entity)
        self.bookmarkedAt = .init()
    }
    
    func convertToEntity() throws -> Entity {
        return try JSONDecoder().decode(Entity.self, from: entity)
    }
}
