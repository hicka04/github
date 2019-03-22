//
//  UserSearchResultViewController.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol UserSearchResultView: SearchResultView {
    
}

final class UserSearchResultViewController: UIViewController {
    
    var presenter: UserSearchResultViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension UserSearchResultViewController: UserSearchResultView {
    
}

