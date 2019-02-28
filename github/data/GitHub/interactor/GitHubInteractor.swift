//
//  GitHubInteractor.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

class GitHubInteractor {
    
    let client = GitHubClient()
}

extension GitHubInteractor: GitHubUsecase {
    
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
    
    func searchBranch(from repository: Repository,
                      completion: @escaping (Result<Branch, GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchBranch(repository: repository)
        client.send(request: request, completion: completion)
    }
}
