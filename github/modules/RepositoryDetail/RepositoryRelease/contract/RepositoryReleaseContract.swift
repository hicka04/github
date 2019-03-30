//
//  RepositoryReleaseContract.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import entity

protocol RepositoryReleaseView: AnyObject {
    
    func updateReleases(_ releases: [Release])
}

protocol RepositoryReleaseViewPresentation: AnyObject {
    
    func viewDidLoad()
}

protocol RepositoryReleaseWireframe: AnyObject {
    
}
