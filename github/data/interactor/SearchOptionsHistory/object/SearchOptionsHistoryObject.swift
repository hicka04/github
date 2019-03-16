//
//  SearchOptionsHistoryObject.swift
//  github
//
//  Created by hicka04 on 2019/03/16.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
final class SearchOptionsHistoryObject: Object {
    
    private(set) dynamic var keyword: String = ""
    private(set) dynamic var lastSearchAt: Date = .init()
    
    convenience init(keyword: String) {
        self.init()
        self.keyword = keyword
    }
    
    override static func primaryKey() -> String? {
        return "keyword"
    }
    
    func updateLastSearchDate() {
        lastSearchAt = .init()
    }
}

