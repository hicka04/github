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
    
    private(set) dynamic var searchOptions: SearchOptionsObject!
    private(set) dynamic var lastSearchAt: Date = .init()
    
    convenience init(searchOptions: SearchOptionsObject) {
        self.init()
        self.searchOptions = searchOptions
    }
    
    func updateLastSearchDate() {
        lastSearchAt = .init()
    }
}

