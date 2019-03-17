//
//  Storable.swift
//  github
//
//  Created by hicka04 on 2019/03/17.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import RealmSwift

protocol Storable {
    
    associatedtype ManagedObject: Object
    
    init(object: ManagedObject)
    func object() -> ManagedObject
}
