//
//  GitHubRepositoryInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubRepositoryUsecase: AnyObject {
    func searchRepositories(from keyword: String,
                            completion: @escaping (Result<[Repository], GitHubClientError>) -> Void)
}

class GitHubRepositoryInteractor {
    
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

extension GitHubRepositoryInteractor: GitHubRepositoryUsecase {
    
    func searchRepositories(from keyword: String,
                            completion: @escaping (Result<[Repository], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchRepositories(keyword: keyword)
        client.send(request: request) { result in
            switch result {
            case .success(let response):
                completion(.success(response.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
