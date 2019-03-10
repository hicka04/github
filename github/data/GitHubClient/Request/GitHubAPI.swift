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
    
    struct SearchReadme: GitHubRequest {
        
        typealias Response = Readme
        
        var path: String {
            return "/repos/\(repository.fullName)/readme"
        }
        
        let method: HTTPMethod = .get
        
        let queryItems: [URLQueryItem] = []
        
        let repository: Repository
    }
    
    struct SearchRepositoryContents: GitHubRequest {
        
        typealias Response = [RepositoryContent]
        
        var path: String {
            return "/repos/\(repository.fullName)/contents/\(contentsPath)"
        }
        
        let method: HTTPMethod = .get
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "ref", value: branch ?? repository.defaultBranch)]
        }
        
        let repository: Repository
        let contentsPath: String
        let branch: String?
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
