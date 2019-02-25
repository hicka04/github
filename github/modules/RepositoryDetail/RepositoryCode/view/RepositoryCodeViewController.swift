//
//  RepositoryCodeViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryCodeViewController: UIViewController {
    
    var presenter: RepositoryCodeViewPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension RepositoryCodeViewController: RepositoryCodeView {
    
}
