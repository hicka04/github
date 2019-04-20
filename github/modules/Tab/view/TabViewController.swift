//
//  TabViewController.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit

protocol TabView: AnyObject {
    
}

final class TabViewController: UITabBarController {
    
    var presenter: TabViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowOpacity = 0.4
    }
}

extension TabViewController: TabView {
    
}

extension TabViewController: UITabBarControllerDelegate {
    
    
}
