//
//  SearchOptionsViewController.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol SearchOptionsView: AnyObject {
    
}

final class SearchOptionsViewController: UIViewController {
    
    var presenter: SearchOptionsViewPresentation!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension SearchOptionsViewController: SearchOptionsView {
    
}

