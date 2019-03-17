//
//  GitHubRepositoryContentsInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubRepositoryContentsUsecase: AnyObject {
    
    func searchRepositoryContents(branch: String?,
                                  completion: @escaping (Result<[RepositoryContent], GitHubClientError>) -> Void)
}

final class GitHubRepositoryContentsInteractor {
    
    private let client: GitHubRequestable
    
    private let repository: Repository
    private let path: String
    
    init(client: GitHubRequestable = GitHubClient(),
         repository: Repository,
         path: String) {
        self.client = client
        self.repository = repository
        self.path = path
    }
}

extension GitHubRepositoryContentsInteractor: GitHubRepositoryContentsUsecase {
    
    func searchRepositoryContents(branch: String?,
                                  completion: @escaping (Result<[RepositoryContent], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchRepositoryContents(repository: repository, contentsPath: path, branch: branch)
        client.send(request: request, completion: completion)
    }
}
