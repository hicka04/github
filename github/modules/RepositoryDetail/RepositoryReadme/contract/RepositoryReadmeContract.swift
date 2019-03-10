//
//  RepositoryReadmeContract.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryReadmeView: AnyObject {
    
    func updateReadme(_ readme: Readme)
}

protocol RepositoryReadmeViewPresentation: AnyObject {
    
    func viewDidLoad()
}

protocol RepositoryReadmeWireframe: AnyObject {
    
}
