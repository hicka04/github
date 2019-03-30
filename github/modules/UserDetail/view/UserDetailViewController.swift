//
//  UserDetailViewController.swift
//  github
//
//  Created by hikaru on 2019/3/23.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import WebKit

protocol UserDetailView: AnyObject {
    
    func load(_ url: URL)
}

final class UserDetailViewController: UIViewController {
    
    var presenter: UserDetailViewPresentation!
    
    @IBOutlet private weak var webView: WKWebView!
    
    init(userName: String) {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = userName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension UserDetailViewController: UserDetailView {
    
    func load(_ url: URL) {
        webView.load(URLRequest(url: url))
    }
}

