//
//  RepositoryDetailViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/21.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryDetailPageViewPresenter {
    
    private weak var view: RepositoryDetailPageView?
    private let router: RepositoryDetailPageWireframe
    private let interactor: GitHubBranchUsecase
    
    private let repository: Repository
    private var branch: Branch? {
        didSet {
            showContentView(segmentedIndex: segmentedIndex,
                            repository: repository,
                            branch: branch)
        }
    }
    private var segmentedIndex: Int = 0 {
        didSet {
            showContentView(segmentedIndex: segmentedIndex,
                            repository: repository,
                            branch: branch)
        }
    }
    
    init(view: RepositoryDetailPageView,
         router: RepositoryDetailPageWireframe,
         interactor: GitHubBranchUsecase,
         repository: Repository) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.repository = repository
    }
    
    private func showContentView(segmentedIndex: Int, repository: Repository, branch: Branch?) {
        guard let content = RepositoryDetailContent(segmentedIndex: segmentedIndex,
                                                    repository: repository,
                                                    branch: branch) else {
            return
        }
        
        router.show(content: content)
    }
}

extension RepositoryDetailPageViewPresenter: RepositoryDetailPageViewPresentation {
    
    func viewDidLoad() {
        interactor.searchBranch(from: repository) { result in
            switch result {
            case .success(let branch):
                self.branch = branch
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectedSegmentIndexChanged(_ index: Int) {
        segmentedIndex = index
    }
}
