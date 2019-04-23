//
//  GitHubAPI.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/18.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation
import entity

final class GitHubAPI {
    
    private init() {}
    
    struct SearchRepositories: GitHubSearchRequest {
        
        typealias Response = SearchResponse<Repository>
        
        let path: String = "/search/repositories"
        
        let method: HTTPMethod = .get
        
        let keyword: String
        let language: Language?
    }
    
    struct SearchUsers: GitHubSearchRequest {
        
        typealias Response = SearchResponse<User>
        
        let path: String = "/search/users"
        
        let method: HTTPMethod = .get
        
        let keyword: String
        let language: Language?
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
            return [URLQueryItem(name: "ref", value: branch)]
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
