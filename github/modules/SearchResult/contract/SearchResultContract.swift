//
//  SearchResultContract.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol SearchResultView: AnyObject {
    
}

protocol SearchResultViewPresentation: AnyObject {
    
    func viewDidLoad()
    
    func searchBarSearchButtonClicked(text: String)
}

protocol SearchResultWireframe: AnyObject {
    
    func showRepositoryDetailView()
}
