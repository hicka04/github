//
//  TreeResponse.swift
//  github
//
//  Created by hicka04 on 2019/03/01.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

struct TreeResponse: Decodable {
    
    let trees: [Tree]
    
    enum CodingKeys: String, CodingKey {
        case trees = "tree"
    }
}
