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
    let description: String?
    let stargazersCount: Int
    let language: String?
    let defaultBranch: String
    let updatedAt: Date
    let owner: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName
        case description
        case stargazersCount
        case language
        case defaultBranch
        case updatedAt
        case owner
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(ID.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        fullName = try values.decode(String.self, forKey: .fullName)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        stargazersCount = try values.decode(Int.self, forKey: .stargazersCount)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch) ?? "master"
        updatedAt = try values.decode(Date.self, forKey: .updatedAt)
        owner = try values.decode(User.self, forKey: .owner)
    }
}

extension Repository {
    
    struct ID: RawRepresentable, Decodable {
        let rawValue: Int
    }
}
