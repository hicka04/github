//
//  User.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/11.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation

public struct User: Codable {
    
    public let id: ID
    public let login: String
    public let avatarUrl: URL
    public let htmlUrl: URL
}

extension User {
    
    public struct ID: RawRepresentable, Codable {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
