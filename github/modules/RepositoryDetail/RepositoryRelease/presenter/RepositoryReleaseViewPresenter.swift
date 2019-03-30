//
//  RepositoryReleaseViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import data
import entity

final class RepositoryReleaseViewPresenter {
    
    private weak var view: RepositoryReleaseView?
    private let router: RepositoryReleaseWireframe
    private let interactor: GitHubReleaseUsecase
    
    private var releases: [Release] = [] {
        didSet {
            view?.updateReleases(releases)
        }
    }
    
    init(view: RepositoryReleaseView,
         router: RepositoryReleaseWireframe,
         interactor: GitHubReleaseUsecase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension RepositoryReleaseViewPresenter: RepositoryReleaseViewPresentation {
    
    func viewDidLoad() {
        interactor.searchReleases { result in
            switch result {
            case .success(let releases):
                self.releases = releases
            case .failure(let error):
                print(error)
            }
        }
    }
}
