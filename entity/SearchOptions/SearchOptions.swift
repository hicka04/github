//
//  SearchOptions.swift
//  github
//
//  Created by hicka04 on 2019/03/17.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

public struct SearchOptions {
    
    public let keyword: String
    public let searchType: SearchType
    public let language: Language?
    
    public init(keyword: String,
                searchType: SearchType,
                language: Language?) {
        self.keyword = keyword
        self.searchType = searchType
        self.language = language
    }
}

extension SearchOptions {
    
    @objc public enum SearchType: Int {
        case repository
        case user
    }
}
