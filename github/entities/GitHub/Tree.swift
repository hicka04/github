//
//  Tree.swift
//  github
//
//  Created by hicka04 on 2019/03/01.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

struct Tree: Decodable, Comparable {
    
    let path: String
    let type: Type
    let sha: SHA
    
    static func < (lhs: Tree, rhs: Tree) -> Bool {
        if lhs.type == rhs.type {
            return lhs.path < rhs.path
        } else {
            return rhs.type == .blob
        }
    }
}

extension Tree {
    
    enum `Type`: String, Decodable {
        case blob
        case tree
    }
}
