//
//  RepositoryReadmeViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import MarkdownView

final class RepositoryReadmeViewController: UIViewController {
    
    var presenter: RepositoryReadmeViewPresentation!
    
    @IBOutlet private weak var markdownView: MarkdownView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RepositoryReadmeViewController: RepositoryReadmeView {
    
}
