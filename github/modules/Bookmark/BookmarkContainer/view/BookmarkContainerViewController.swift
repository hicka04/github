//
//  BookmarkContainerViewController.swift
//  github
//
//  Created by hikaru on 2019/4/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import ActionClosurable
import entity

protocol BookmarkContainerView: AnyObject {
    
}

final class BookmarkContainerViewController: UIPageViewController {
    
    var presenter: BookmarkContainerViewPresentation!
    
    private lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: SearchOptions.SearchType.allCases.map { $0.title })
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    init() {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
        delegate = self
    }
    
    private override convenience init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        self.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        navigationItem.titleView = segment
        segment.on(.valueChanged) { segment in
            self.presenter.selectedSegmentIndexChanged(segment.selectedSegmentIndex)
        }
        
        presenter.viewDidLoad()
    }
}

extension BookmarkContainerViewController: BookmarkContainerView {
    
}

extension BookmarkContainerViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard let contentView = pageViewController.viewControllers?.first as? PageViewContentView else {
            return
        }
        
        segment.selectedSegmentIndex = contentView.index
    }
}
