//
//  RepositoryCodeViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryTreeViewPresenter {
    
    private weak var view: RepositoryTreeView?
    private let router: RepositoryTreeWireframe
    private let interactor: GitHubUsecase
    
    private let repository: Repository
    private let sha: SHA
    
    private var trees: [Tree] = [] {
        didSet {
            view?.updateTrees(trees)
        }
    }
    
    init(view: RepositoryTreeView,
         router: RepositoryTreeWireframe,
         interactor: GitHubUsecase,
         repository: Repository, sha: SHA) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.repository = repository
        self.sha = sha
    }
}

extension RepositoryTreeViewPresenter: RepositoryTreeViewPresentation {
    
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
}
