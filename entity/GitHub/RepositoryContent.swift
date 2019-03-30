//
//  RepositoryContent.swift
//  github
//
//  Created by hicka04 on 2019/03/01.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

public struct RepositoryContent: Decodable, Comparable {
    
    public let name: String
    public let path: String
    public let type: Type
    public let htmlUrl: URL
    
    public static func < (lhs: RepositoryContent, rhs: RepositoryContent) -> Bool {
        if lhs.type == rhs.type {
            return lhs.name < rhs.name
        } else {
            return rhs.type == .file
        }
    }
}

extension RepositoryContent {
    
    public enum `Type`: String, Decodable {
        case file
        case dir
    }
}
