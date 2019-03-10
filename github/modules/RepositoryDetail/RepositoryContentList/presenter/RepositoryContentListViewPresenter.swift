//
//  RepositoryContentListViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryContentListViewPresenter {
    
    private weak var view: RepositoryContentListView?
    private let router: RepositoryContentListWireframe
    private let interactor: GitHubRepositoryContentsUsecase
    
    private var contents: [RepositoryContent] = [] {
        didSet {
            view?.updateContents(contents)
        }
    }
    
    init(view: RepositoryContentListView,
         router: RepositoryContentListWireframe,
         interactor: GitHubRepositoryContentsUsecase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension RepositoryContentListViewPresenter: RepositoryContentListViewPresentation {
    
    func viewDidLoad() {
        interactor.searchRepositoryContents(branch: nil) { result in
            switch result {
            case .success(let contents):
                self.contents = contents.sorted()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let content = contents[indexPath.row]
        switch content.type {
        case .dir:
            router.showRepositoryContentListView(content, branch: nil)
        case .file:
            router.showRepositoryContentView(content, branch: nil)
        }
    }
}
