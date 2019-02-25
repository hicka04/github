//
//  RepositoryReleaseViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryReleaseViewController: UIViewController {

    var presenter: RepositoryReleaseViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositoryReleaseViewController: RepositoryReleaseView {
    
}
