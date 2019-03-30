//
//  URLQueryItem+extension.swift
//  github
//
//  Created by hicka04 on 2019/03/30.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

extension URLQueryItem {
    
    func addingUrlQueryEncode() -> URLQueryItem {
        return URLQueryItem(name: name, value: value?.addingPercentEncoding(withAllowedCharacters: .alphanumerics))
    }
}
