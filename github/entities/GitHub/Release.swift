//
//  Release.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

struct Release: Decodable {
    
    let name: String
    let tagName: String
    let body: String
    let author: User
}
