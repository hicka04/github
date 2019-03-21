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
    let searchType: SearchType
    
    init(keyword: String,
         searchType: SearchType) {
        self.keyword = keyword
        self.searchType = searchType
    }
    
    init(object: SearchOptionsObject) {
        self.keyword = object.keyword
        self.searchType = object.searchType
    }
    
    func object() -> SearchOptionsObject {
        return SearchOptionsObject(keyword: keyword,
                                   searchType: searchType)
    }
}

extension SearchOptions {
    
    @objc enum SearchType: Int {
        case repository
        case user
    }
}
