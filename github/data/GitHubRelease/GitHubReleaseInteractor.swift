//
//  GitHubReleaseInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubReleaseUsecase: AnyObject {
    func searchReleases(from repository: Repository,
                        completion: @escaping (Result<[Release], GitHubClientError>) -> Void)
}

class GitHubReleaseInteractor {
    
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

extension GitHubReleaseInteractor: GitHubReleaseUsecase {
    
    func searchReleases(from repository: Repository,
                        completion: @escaping (Result<[Release], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchReleases(repository: repository)
        client.send(request: request, completion: completion)
    }
}
