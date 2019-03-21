//
//  RepositorySearchResultContract.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositorySearchResultView: AnyObject {
    
    func updateSearchResults(_ repositories: [Repository])
    func showSearchErrorAlert()
    func scrollToTop()
}

protocol RepositorySearchResultViewPresentation: AnyObject {
    
    func viewDidLoad()
    
    func refreshControlDidRefresh()
    func didSelectRow(at indexPath: IndexPath)
}

protocol RepositorySearchResultWireframe: AnyObject {
    
    func showSearchOptionsView()
    func showRepositoryDetailView(repository: Repository)
}
