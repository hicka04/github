//
//  RepositoryDetailContract.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol RepositoryDetailPageView: AnyObject {
    
    func setSegmentedIndex(_ index: Int)
}

protocol RepositoryDetailPageViewPresentation: AnyObject {
    
    func viewDidLoad()
    func selectedSegmentIndexChanged(_ index: Int)
    func pageViewDidFinishLoadPage(_ index: Int)
}

protocol RepositoryDetailPageWireframe: AnyObject {
    
    func showDetailPage(_ page: RepositoryDetailPage)
}

enum RepositoryDetailPage: Int, CaseIterable {
    case readme
    case contents
    case release
    
    var title: String {
        switch self {
        case .readme:   return "README.md"
        case .contents: return "Codes"
        case .release:  return "Release"
        }
    }
}

protocol RepositoryDetailPageContentView {
    
    var index: Int { get }
}

extension RepositoryDetailPageContentView where Self: RepositoryReadmeView {
    
    var index: Int {
        return 0
    }
}

extension RepositoryDetailPageContentView where Self: RepositoryContentListView {
    
    var index: Int {
        return 1
    }
}

extension RepositoryDetailPageContentView where Self: RepositoryReleaseView {
    
    var index: Int {
        return 2
    }
}
