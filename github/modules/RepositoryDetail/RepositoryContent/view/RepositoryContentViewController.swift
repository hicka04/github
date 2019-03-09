//
//  RepositoryContentViewController.swift
//  github
//
//  Created by hicka04 on 2019/03/09.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryContentViewController: UIViewController {

    var presenter: RepositoryContentViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositoryContentViewController: RepositoryContentView {
    
}
