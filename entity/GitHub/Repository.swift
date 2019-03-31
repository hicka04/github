//
//  Repository.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/11.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation

public struct Repository: Decodable {
    
    public let id: ID
    public let name: String
    public let fullName: String
    public let description: String?
    public let stargazersCount: Int
    public let language: String?
    public let defaultBranch: String
    public let updatedAt: Date
    public let owner: User
    
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
    
    public init(from decoder: Decoder) throws {
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
    
    public struct ID: RawRepresentable, Decodable {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
