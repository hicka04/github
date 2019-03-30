//
//  GitHubClient.swift
//  swift-rindoku-sample
//
//  Created by SCI01552 on 2018/10/25.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import Foundation

protocol GitHubRequestable {
    
    func send<Request: GitHubRequest>(request: Request,
                                      completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void)
}

final class GitHubClient {
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
}

extension GitHubClient: GitHubRequestable {
    
    func send<Request: GitHubRequest>(request: Request,
                                      completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        
        let urlRequest = request.buildURLRequest()
        print(urlRequest.url ?? "")
        let task = session.dataTask(with: urlRequest) { data, response, error in
            switch (data, response, error) {
            case (_, _, let error?):
                completion(.failure(.connectionError(error)))
                
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(.success(response))
                } catch let error as GitHubAPIError {
                    completion(.failure(.apiError(error)))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
                
            default:
                fatalError("Invalid response combination")
            }
        }
        
        task.resume()
    }
}
