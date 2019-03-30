//
//  GithubUserInteractor.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol GithubUserUsecase {
    
    func searchUsers(from keyword: String,
                     language: Language?,
                     completion: @escaping (Result<[User], GitHubClientError>) -> Void)
}

final class GithubUserInteractor {
    
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

extension GithubUserInteractor: GithubUserUsecase {
    
    func searchUsers(from keyword: String,
                     language: Language?,
                     completion: @escaping (Result<[User], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchUsers(keyword: keyword, language: language)
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

