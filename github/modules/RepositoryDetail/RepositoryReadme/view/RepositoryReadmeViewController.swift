//
//  RepositoryReadmeViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import WebKit
import entity

final class RepositoryReadmeViewController: UIViewController, RepositoryDetailPageContentView {
    
    var presenter: RepositoryReadmeViewPresentation!
    
    @IBOutlet private weak var webView: WKWebView!
    
    private var readme: Readme? {
        didSet {
            guard let url = readme?.htmlUrl else {
                return
            }
            DispatchQueue.main.async {
                self.webView.load(URLRequest(url: url))
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
