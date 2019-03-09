//
//  RepositoryContentContract.swift
//  github
//
//  Created by hicka04 on 2019/03/09.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryContentView: AnyObject {
    
    func load(_ url: URL)
}

protocol RepositoryContentViewPresentation: AnyObject {
    
    func viewDidLoad()
}

protocol RepositoryContentWireframe: AnyObject {
    
}
