//
//  Branch.swift
//  github
//
//  Created by hicka04 on 2019/02/27.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

struct Branch: Decodable {
    
    let name: String
    private let commit: Commit
    var sha: SHA {
        return commit.commit.tree.sha
    }
}

private extension Branch {
    
    struct Commit: Decodable {
        
        let commit: Commit
        
        struct Commit: Decodable {
            
            let tree: Tree
            
            struct Tree: Decodable {
                
                let sha: SHA
                let url: URL
            }
        }
    }
}
