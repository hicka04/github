//
//  GitHubReleaseInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import entity

public protocol GitHubReleaseUsecase: AnyObject {
    
    func searchReleases(completion: @escaping (Result<[Release], GitHubClientError>) -> Void)
}

public final class GitHubReleaseInteractor {
    
    private let client: GitHubRequestable
    
    private let repository: Repository
    
    public convenience init(repository: Repository) {
        self.init(client: GitHubClient(),
                  repository: repository)
    }
    
    init(client: GitHubRequestable = GitHubClient(),
         repository: Repository) {
        self.client = client
        self.repository = repository
    }
}

extension GitHubReleaseInteractor: GitHubReleaseUsecase {
    
    public func searchReleases(completion: @escaping (Result<[Release], GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchReleases(repository: repository)
        client.send(request: request, completion: completion)
    }
}
