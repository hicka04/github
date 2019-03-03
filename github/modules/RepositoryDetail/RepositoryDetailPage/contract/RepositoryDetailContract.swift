//
//  RepositoryDetailContract.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryDetailPageView: AnyObject {
    
}

protocol RepositoryDetailPageViewPresentation: AnyObject {
    
    func viewDidLoad()
    func selectedSegmentIndexChanged(_ index: Int)
}

protocol RepositoryDetailPageWireframe: AnyObject {
    
    func show(content: RepositoryDetailContent)
}

enum RepositoryDetailContent {
    case readme(Repository)
    case tree(Repository, SHA)
    case release(Repository)
    
    init?(segmentedIndex: Int, repository: Repository, branch: Branch?) {
        switch (segmentedIndex, repository, branch) {
        case (0, let repository, _): self = .readme(repository)
        case (1, let repository, let branch?): self = .tree(repository, branch.sha)
        case (2, let repository, _):           self = .release(repository)
        default:                               return nil
        }
    }
}
