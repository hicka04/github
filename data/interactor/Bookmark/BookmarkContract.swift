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

public protocol Bookmarkable where Self: Codable {
    
    associatedtype ID: RawRepresentable
    var id: ID { get }
}

public protocol BookmarkUsecase {
    
    associatedtype Entity: Bookmarkable
    
    func add(_ entity: Entity)
    func delete(_ entity: Entity)
    func contains(_ entity: Entity) -> Bool
    func observe(handler: @escaping ([Entity]) -> Void)
}
