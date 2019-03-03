//
//  Readme.swift
//  github
//
//  Created by hicka04 on 2019/03/03.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

struct Readme: Decodable {
    
    let content: String
    var markdown: Markdown? {
        guard let data = Data(base64Encoded: content, options: .ignoreUnknownCharacters),
            let markdownString = String(data: data, encoding: .utf8) else {
            return nil
        }
        return Markdown(rawValue: markdownString)
    }
}

extension Readme {
    
    struct Markdown: RawRepresentable {
        let rawValue: String
    }
}
