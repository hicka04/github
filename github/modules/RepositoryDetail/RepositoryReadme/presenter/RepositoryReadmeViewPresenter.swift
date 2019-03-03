//
//  RepositoryReadmeViewPresenter.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

final class RepositoryReadmeViewPresenter {
    
    private weak var view: RepositoryReadmeView?
    private let router: RepositoryReadmeRouter
    private let interactor: GitHubReadmeUsecase
    
    private var branch: String?
    
    private var readme: Readme? {
        didSet {
            guard let readme = readme else {
                return
            }
            
            view?.updateReadme(readme)
        }
    }
    
    init(view: RepositoryReadmeView,
         router: RepositoryReadmeRouter,
         interactor: GitHubReadmeUsecase,
         branch: String?) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        self.branch = branch
    }
}

extension RepositoryReadmeViewPresenter: RepositoryReadmeViewPresentation {
    
    func viewDidLoad() {
        interactor.searchReadme(branch: branch) { result in
            switch result {
            case .success(let readme):
                self.readme = readme
            case .failure(let error):
                print(error)
            }
        }
    }
}
