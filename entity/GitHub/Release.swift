//
//  Release.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

public struct Release: Decodable {
    
    public let name: String
    public let tagName: String
    public let body: String
    public let author: User
}
