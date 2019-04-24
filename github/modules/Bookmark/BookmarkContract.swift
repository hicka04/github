//
//  BookmarkContract.swift
//  github
//
//  Created by hicka04 on 2019/04/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol BookmarkView: AnyObject {
    
    associatedtype BookmarkEntity
    
    func update(_ entities: [BookmarkEntity])
}
