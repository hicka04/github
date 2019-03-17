//
//  SearchReadmeInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/03.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubReadmeUsecase: AnyObject {
    
    func searchReadme(branch: String?,
                      completion: @escaping (Result<Readme, GitHubClientError>) -> Void)
}

class GitHubReadmeInteractor {
    
    private let client: GitHubRequestable
    
    private let repository: Repository
    
    init(client: GitHubRequestable = GitHubClient(),
         repository: Repository) {
        self.client = client
        self.repository = repository
    }
}

extension GitHubReadmeInteractor: GitHubReadmeUsecase {
    
    func searchReadme(branch: String?,
                      completion: @escaping (Result<Readme, GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchReadme(repository: repository)
        client.send(request: request, completion: completion)
    }
}
