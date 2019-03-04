//
//  RepositoryCodeViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryContentsViewPresenter {
    
    private weak var view: RepositoryContentsView?
    private let router: RepositoryContentsWireframe
    private let interactor: GitHubRepositoryContentsUsecase
    
    private var contents: [RepositoryContent] = [] {
        didSet {
            view?.updateContents(contents)
        }
    }
    
    init(view: RepositoryContentsView,
         router: RepositoryContentsWireframe,
         interactor: GitHubRepositoryContentsUsecase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension RepositoryContentsViewPresenter: RepositoryContentsViewPresentation {
    
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
            router.showRepositoryContentsView(content, branch: nil)
        case .file:
            break
        }
    }
}
