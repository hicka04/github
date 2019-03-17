//
//  SearchOptions.swift
//  github
//
//  Created by hicka04 on 2019/03/17.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift

struct SearchOptions: Storable {
    
    let keyword: String
    
    init(keyword: String) {
        self.keyword = keyword
    }
    
    init(object: SearchOptionsObject) {
        self.keyword = object.keyword
    }
    
    func object() -> SearchOptionsObject {
        return SearchOptionsObject(keyword: keyword)
    }
}
