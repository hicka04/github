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
    
    private var readme: Readme? {
        didSet {
            DispatchQueue.main.async {
                self.markdownView.load(markdown: self.readme?.markdown?.rawValue, enableImage: true)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension RepositoryReadmeViewController: RepositoryReadmeView {
    
    func updateReadme(_ readme: Readme) {
        self.readme = readme
    }
}
