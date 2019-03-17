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
    func setLastSearchKeyword(_ keyword: String)
}

protocol SearchResultViewPresentation: AnyObject {
    
    func viewDidLoad()
    
    func searchBarSearchButtonClicked(text: String)
    func refreshControlDidRefresh(text: String)
    func didSelectRow(at indexPath: IndexPath)
}

protocol SearchResultWireframe: AnyObject {
    
    func showRepositoryDetailView(repository: Repository)
}
