//
//  RepositoryCodeContract.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryContentsView: AnyObject {
    
    func updateContents(_ contents: [RepositoryContent])
}

protocol RepositoryContentsViewPresentation: AnyObject {
    
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
}

protocol RepositoryContentsWireframe: AnyObject {
    
    func showRepositoryContentsView(path: String, branch: String?)
}
