//
//  RepositoryCodeContract.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryTreeView: AnyObject {
    
    func updateTrees(_ trees: [Tree])
}

protocol RepositoryTreeViewPresentation: AnyObject {
    
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
}

protocol RepositoryTreeWireframe: AnyObject {
    
    func showTreeView(from repository: Repository, sha: SHA, path: String)
}
