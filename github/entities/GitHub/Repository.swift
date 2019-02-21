//
//  Repository.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/11.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    
    let id: ID
    let name: String
    let fullName: String
    let description: String
    let stargazersCount: Int
    let language: String?
    let owner: User
}

extension Repository {
    
    struct ID: RawRepresentable, Decodable {
        let rawValue: Int
    }
}
