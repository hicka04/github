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
    private let interactor: GitHubUsecase
    
    private let repository: Repository
    private var branch: Branch? {
        didSet {
            let firstContent = RepositoryDetailContent.allCases.first!
            router.showContentView(for: firstContent.rawValue)
        }
    }
    
    init(view: RepositoryDetailPageView,
         router: RepositoryDetailPageWireframe,
         interactor: GitHubUsecase,
         repository: Repository) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.repository = repository
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
        router.showContentView(for: index)
    }
}
