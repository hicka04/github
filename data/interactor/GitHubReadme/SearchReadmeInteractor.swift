//
//  SearchReadmeInteractor.swift
//  github
//
//  Created by hicka04 on 2019/03/03.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation
import entity

public protocol GitHubReadmeUsecase: AnyObject {
    
    func searchReadme(branch: String?,
                      completion: @escaping (Result<Readme, GitHubClientError>) -> Void)
}

public final class GitHubReadmeInteractor {
    
    private let client: GitHubRequestable
    
    private let repository: Repository
    
    public convenience init(repository: Repository) {
        self.init(client: GitHubClient(),
                  repository: repository)
    }
    
    init(client: GitHubRequestable,
         repository: Repository) {
        self.client = client
        self.repository = repository
    }
}

extension GitHubReadmeInteractor: GitHubReadmeUsecase {
    
    public func searchReadme(branch: String?,
                             completion: @escaping (Result<Readme, GitHubClientError>) -> Void) {
        let request = GitHubAPI.SearchReadme(repository: repository)
        client.send(request: request, completion: completion)
    }
}
