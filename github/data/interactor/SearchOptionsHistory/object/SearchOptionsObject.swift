//
//  SearchOptionsObject.swift
//  github
//
//  Created by hicka04 on 2019/03/17.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
final class SearchOptionsObject: Object {
    
    private(set) dynamic var keyword: String = ""
    
    convenience init(keyword: String) {
        self.init()
        self.keyword = keyword
    }
}
