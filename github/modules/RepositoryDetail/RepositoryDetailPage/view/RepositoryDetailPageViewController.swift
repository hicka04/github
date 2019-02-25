//
//  RepositoryDetailViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import ActionClosurable

final class RepositoryDetailPageViewController: UIPageViewController {
    
    var presenter: RepositoryDetailPageViewPresentation!
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: RepositoryDetailContent.allCases.map { $0.title })
        segmentedControl.selectedSegmentIndex = 0
        
        return segmentedControl
    }()
    
    convenience init() {
        self.init(transitionStyle: .scroll,
                  navigationOrientation: .horizontal,
                  options: nil)
    }
    
    private override init(transitionStyle style: UIPageViewController.TransitionStyle,
                          navigationOrientation: UIPageViewController.NavigationOrientation,
                          options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style,
                   navigationOrientation: navigationOrientation,
                   options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.on(.valueChanged) { segmentedControl in
            self.presenter.selectedSegmentIndexChanged(segmentedControl.selectedSegmentIndex)
        }
        navigationItem.titleView = segmentedControl
        
        presenter.viewDidLoad()
    }
}

extension RepositoryDetailPageViewController: RepositoryDetailPageView {
    
}
