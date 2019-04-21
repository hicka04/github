//
//  BookmarkContainerViewController.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import entity

protocol BookmarkContainerView: AnyObject {
    
}

final class BookmarkContainerViewController: UITableViewController {
    
    var presenter: BookmarkContainerViewPresentation!
    
    private var segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: SearchOptions.SearchType.allCases.map { $0.title })
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = segment
        
        presenter.viewDidLoad()
    }
}

extension BookmarkContainerViewController: BookmarkContainerView {
    
}

