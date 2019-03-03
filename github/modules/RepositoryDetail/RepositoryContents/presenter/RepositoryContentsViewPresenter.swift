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
    private let interactor: GitHubRepositoryContentssUsecase
    
    private let repository: Repository
    private let sha: SHA
    
    private var trees: [Tree] = [] {
        didSet {
            view?.updateTrees(trees)
        }
    }
    
    init(view: RepositoryContentsView,
         router: RepositoryContentsWireframe,
         interactor: GitHubRepositoryContentssUsecase,
         repository: Repository, sha: SHA) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.repository = repository
        self.sha = sha
    }
}

extension RepositoryContentsViewPresenter: RepositoryContentsViewPresentation {
    
    func viewDidLoad() {
        interactor.searchTrees(from: repository, sha: sha) { result in
            switch result {
            case .success(let trees):
                self.trees = trees.sorted()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let tree = trees[indexPath.row]
        switch tree.type {
        case .tree:
            router.showTreeView(from: repository, sha: tree.sha, path: tree.path)
        case .blob:
            break
        }
    }
}
