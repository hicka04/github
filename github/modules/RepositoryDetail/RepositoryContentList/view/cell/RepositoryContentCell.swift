//
//  RepositoryContentCell.swift
//  github
//
//  Created by hicka04 on 2019/03/04.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

class RepositoryContentCell: UITableViewCell, ClassRegistrable {

    func set(content: RepositoryContent) {
        imageView?.image = content.image
        imageView?.tintColor = .darkGray
        textLabel?.text = content.name
        accessoryType = .disclosureIndicator
    }
}

private extension RepositoryContent {
    
    var image: UIImage {
        switch self.type {
        case .dir:  return #imageLiteral(resourceName: "dir")
        case .file: return #imageLiteral(resourceName: "file")
        }
    }
}
