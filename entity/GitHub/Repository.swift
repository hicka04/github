//
//  Repository.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/11.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation

public struct Repository: Codable {
    
    public let id: ID
    public let name: String
    public let fullName: String
    public let description: String?
    public let stargazersCount: Int
    public let language: String?
    public let updatedAt: Date
    public let owner: User
}

extension Repository {
    
    public struct ID: RawRepresentable, Codable {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
