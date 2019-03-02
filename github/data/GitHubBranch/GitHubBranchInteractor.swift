//
//  GitHubBranchInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/02.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubBranchUsecase: AnyObject {
    func searchBranch(from repository: Repository,
                      completion: @escaping (Result<Branch, GitHubClientError>) -> Void)
}

class GitHubBranchInteractor {
    
    private let client: GitHubRequestable
    
    init(client: GitHubRequestable = GitHubClient()) {
        self.client = client
    }
}

extension GitHubBranchInteractor: GitHubBranchUsecase {
    
    func searchBranch(from repository: Repository,
                      completion: @escaping (Result<Branch, GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchBranch(repository: repository)
        client.send(request: request, completion: completion)
    }
}
