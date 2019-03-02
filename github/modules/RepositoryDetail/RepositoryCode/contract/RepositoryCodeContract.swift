//
//  RepositoryCodeContract.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryCodeView: AnyObject {
    
    func updateTrees(_ trees: [Tree])
}

protocol RepositoryCodeViewPresentation: AnyObject {
    
    func viewDidLoad()
}

protocol RepositoryCodeWireframe: AnyObject {
    
}
