//
//  GitHubContract.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

protocol GitHubUsecase: AnyObject {
    
    func searchRepositories(from keyword: String,
                            completion: @escaping (Result<[Repository], GitHubClientError>) -> Void)
    func searchBranch(from repository: Repository,
                      completion: @escaping (Result<Branch, GitHubClientError>) -> Void)
}
