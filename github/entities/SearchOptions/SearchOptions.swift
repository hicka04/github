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
    let language: Language?
    
    init(keyword: String,
         searchType: SearchType,
         language: Language?) {
        self.keyword = keyword
        self.searchType = searchType
        self.language = language
    }
    
    init(object: SearchOptionsObject) {
        self.keyword = object.keyword
        self.searchType = object.searchType
        self.language = Language(rawValue: object.language ?? "")
    }
    
    func object() -> SearchOptionsObject {
        return SearchOptionsObject(keyword: keyword,
                                   searchType: searchType,
                                   language: language)
    }
}

extension SearchOptions {
    
    @objc enum SearchType: Int {
        case repository
        case user
    }
}
