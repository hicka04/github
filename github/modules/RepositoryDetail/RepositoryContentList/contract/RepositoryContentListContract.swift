//
//  RepositoryContentListContract.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import entity

protocol RepositoryContentListView: AnyObject {
    
    func updateContents(_ contents: [RepositoryContent])
}

protocol RepositoryContentListViewPresentation: AnyObject {
    
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
}

protocol RepositoryContentListWireframe: AnyObject {
    
    func showRepositoryContentListView(_ content: RepositoryContent, branch: String?)
    func showRepositoryContentView(_ content: RepositoryContent, branch: String?)
}
