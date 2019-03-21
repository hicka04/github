//
//  SearchResultContainerViewController.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol SearchResultContainerView: AnyObject {
    
}

final class SearchResultContainerViewController: UIViewController {
    
    var presenter: SearchResultContainerViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Search"
        
        view.backgroundColor = .white

        presenter.viewDidLoad()
    }
}

extension SearchResultContainerViewController: SearchResultContainerView {
    
}

