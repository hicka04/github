//
//  SearchOptionsObject.swift
//  github
//
//  Created by hicka04 on 2019/03/17.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift
import entity

@objcMembers
final class SearchOptionsObject: Object {
    
    private(set) dynamic var keyword: String = ""
    private(set) dynamic var searchType: SearchOptions.SearchType = .repository
    private(set) dynamic var language: String? = nil
    
    convenience init(keyword: String,
                     searchType: SearchOptions.SearchType,
                     language: Language?) {
        self.init()
        self.keyword = keyword
        self.searchType = searchType
        self.language = language?.rawValue
    }
}

extension SearchOptions: Storable {
    
    init(object: SearchOptionsObject) {
        self.init(keyword: object.keyword,
                  searchType: object.searchType,
                  language: Language(rawValue: object.language ?? ""))
    }
    
    func object() -> SearchOptionsObject {
        return SearchOptionsObject(keyword: keyword,
                                   searchType: searchType,
                                   language: language)
    }
    
    
    typealias ManagedObject = SearchOptionsObject
    
    
}
