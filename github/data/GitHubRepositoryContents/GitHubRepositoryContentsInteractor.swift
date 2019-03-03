//
//  GitHubRepositoryContentsInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubRepositoryContentsUsecase: AnyObject {
    func searchTrees(from repository: Repository,
                     sha: SHA,
                     completion: @escaping (Result<[Tree], GitHubClientError>) -> Void)
}

class GitHubRepositoryContentsInteractor {
    
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

extension GitHubRepositoryContentsInteractor: GitHubRepositoryContentsUsecase {
    
    func searchTrees(from repository: Repository,
                     sha: SHA,
                     completion: @escaping (Result<[Tree], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchTrees(repository: repository, sha: sha)
        client.send(request: request) { result in
            switch result {
            case .success(let tree):
                completion(.success(tree.trees))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
