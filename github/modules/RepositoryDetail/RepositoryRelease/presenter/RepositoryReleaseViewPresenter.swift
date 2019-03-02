//
//  RepositoryReleaseViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryReleaseViewPresenter {
    
    private weak var view: RepositoryReleaseView?
    private let router: RepositoryReleaseWireframe
    private let interactor: GitHubReleaseUsecase
    
    private let repository: Repository
    
    private var releases: [Release] = [] {
        didSet {
            view?.updateReleases(releases)
        }
    }
    
    init(view: RepositoryReleaseView,
         router: RepositoryReleaseWireframe,
         interactor: GitHubReleaseUsecase,
         repository: Repository) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.repository = repository
    }
}

extension RepositoryReleaseViewPresenter: RepositoryReleaseViewPresentation {
    
    func viewDidLoad() {
        interactor.searchReleases(from: repository) { result in
            switch result {
            case .success(let releases):
                self.releases = releases
            case .failure(let error):
                print(error)
            }
        }
    }
}
