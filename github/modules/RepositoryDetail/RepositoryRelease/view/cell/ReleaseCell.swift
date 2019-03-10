//
//  ReleaseCell.swift
//  github
//
//  Created by hicka04 on 2019/03/03.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

class ReleaseCell: UITableViewCell, ClassRegistrable {

    func set(release: Release) {
        let releaseTitle = release.name.isEmpty ? release.tagName : release.name
        textLabel?.text = releaseTitle
    }
}
