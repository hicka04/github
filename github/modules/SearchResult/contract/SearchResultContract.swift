//
//  SearchResultContract.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol SearchResultView: AnyObject {
    
    func updateSearchResults(_ repositories: [Repository])
    func showSearchErrorAlert()
    func scrollToTop()
}

protocol SearchResultViewPresentation: AnyObject {
    
    func viewDidLoad()
    
    func refreshControlDidRefresh()
    func didSelectRow(at indexPath: IndexPath)
}

protocol SearchResultWireframe: AnyObject {
    
    func showSearchOptionsView()
    func showRepositoryDetailView(repository: Repository)
}
