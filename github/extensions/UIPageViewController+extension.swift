//
//  UIPageViewController+extension.swift
//  github
//
//  Created by hicka04 on 2019/04/30.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

protocol PageViewContentView where Self: UIViewController {
    
    var index: Int { get }
}
