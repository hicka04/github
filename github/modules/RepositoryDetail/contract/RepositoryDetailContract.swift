//
//  RepositoryDetailContract.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryDetailView: AnyObject {
    
}

protocol RepositoryDetailViewPresentation: AnyObject {
    
    func viewDidLoad()
}

protocol RepositoryDetailWireframe: AnyObject {
    
    func showFirstView()
    func show(content: RepositoryDetailContent,
              from beforeContent: RepositoryDetailContent?)
}

enum RepositoryDetailContent: Int, CaseIterable {
    case readme
    case code
    case release
    
    var title: String {
        switch self {
        case .readme:  return "README.md"
        case .code:    return "Code"
        case .release: return "Release"
        }
    }
}
