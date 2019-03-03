//
//  RepositoryContent.swift
//  github
//
//  Created by hicka04 on 2019/03/01.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

struct RepositoryContent: Decodable, Comparable {
    
    let name: String
    let path: String
    let type: Type
    
    static func < (lhs: RepositoryContent, rhs: RepositoryContent) -> Bool {
        if lhs.type == rhs.type {
            return lhs.name < rhs.name
        } else {
            return rhs.type == .file
        }
    }
}

extension RepositoryContent {
    
    enum `Type`: String, Decodable {
        case file
        case dir
    }
}
