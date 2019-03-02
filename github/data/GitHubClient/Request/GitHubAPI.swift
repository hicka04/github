//
//  GitHubAPI.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/18.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation

final class GitHubAPI {
    
    private init() {}
    
    struct SearchRepositories: GitHubRequest {
        
        typealias Response = SearchResponse<Repository>
        
        let keyword: String
        
        var path: String {
            return "/search/repositories"
        }
        
        let method: HTTPMethod = .get
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "q", value: keyword)]
        }
    }
    
    struct SearchBranch: GitHubRequest {
        
        typealias Response = Branch
        
        let repository: Repository
        let branch: String?
        
        var path: String {
            return "/repos/\(repository.fullName)/branches/\(branch ?? repository.defaultBranch)"
        }
        
        let method: HTTPMethod = .get
        
        let queryItems: [URLQueryItem] = []
        
        init(repository: Repository, branch: String? = nil) {
            self.repository = repository
            self.branch = branch
        }
    }
    
    struct SearchTrees: GitHubRequest {
        
        typealias Response = TreeResponse
        
        var path: String {
            return "/repos/\(repository.fullName)/git/trees/\(sha.rawValue)"
        }
        
        let method: HTTPMethod = .get
        
        let queryItems: [URLQueryItem] = []
        
        let repository: Repository
        let sha: SHA
    }
    
    struct SearchReleases: GitHubRequest {
        
        typealias Response = [Release]
        
        var path: String {
            return "/repos/\(repository.fullName)/releases"
        }
        
        let method: HTTPMethod = .get
        
        let queryItems: [URLQueryItem] = []
        
        let repository: Repository
    }
}
