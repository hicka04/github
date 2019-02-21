//
//  RepositoryDetailViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryDetailViewController: UIViewController {
    
    var presenter: RepositoryDetailViewPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositoryDetailViewController: RepositoryDetailView {
    
}
