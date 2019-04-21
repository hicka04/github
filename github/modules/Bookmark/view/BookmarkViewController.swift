//
//  BookmarkViewController.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol BookmarkView: AnyObject {
    
}

final class BookmarkViewController: UITableViewController {
    
    var presenter: BookmarkViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Bookmarks"
        
        presenter.viewDidLoad()
    }
}

extension BookmarkViewController: BookmarkView {
    
}

