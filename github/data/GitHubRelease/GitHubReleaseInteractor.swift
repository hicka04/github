//
//  GitHubReleaseInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubReleaseUsecase: AnyObject {
    
    func searchReleases(completion: @escaping (Result<[Release], GitHubClientError>) -> Void)
}

final class GitHubReleaseInteractor {
    
    private let client: GitHubRequestable
    
    private let repository: Repository
    
    init(client: GitHubRequestable = GitHubClient(),
         repository: Repository) {
        self.client = client
        self.repository = repository
    }
}

extension GitHubReleaseInteractor: GitHubReleaseUsecase {
    
    func searchReleases(completion: @escaping (Result<[Release], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchReleases(repository: repository)
        client.send(request: request, completion: completion)
    }
}
