//
//  RepositoryContentViewController.swift
//  github
//
//  Created by hicka04 on 2019/03/09.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import WebKit

final class RepositoryContentViewController: UIViewController {

    var presenter: RepositoryContentViewPresentation!
    
    @IBOutlet private weak var webView: WKWebView!
    
    init(contentName: String?) {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = contentName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension RepositoryContentViewController: RepositoryContentView {
    
    func load(_ url: URL) {
        webView.load(URLRequest(url: url))
    }
}
