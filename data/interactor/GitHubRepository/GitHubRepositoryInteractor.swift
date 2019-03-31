//
//  GitHubRepositoryInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import entity

public protocol GitHubRepositoryUsecase: AnyObject {
    
    func searchRepositories(from keyword: String,
                            language: Language?,
                            completion: @escaping (Result<[Repository], GitHubClientError>) -> Void)
}

public final class GitHubRepositoryInteractor {
    
    private let client: GitHubRequestable
    
    public convenience init() {
        self.init(client: GitHubClient())
    }
    
    init(client: GitHubRequestable) {
        self.client = client
    }
}

extension GitHubRepositoryInteractor: GitHubRepositoryUsecase {
    
    public func searchRepositories(from keyword: String,
                                   language: Language?,
                                   completion: @escaping (Result<[Repository], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchRepositories(keyword: keyword, language: language)
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
