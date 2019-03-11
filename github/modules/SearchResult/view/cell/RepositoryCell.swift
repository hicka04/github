//
//  RepositoryCell.swift
//  github
//
//  Created by hicka04 on 2019/02/20.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell, NibRegistrable {

    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starCountLabel: UILabel!
    
    func set(repository: Repository) {
        ownerImageView.load(with: repository.owner.avatarUrl)
        repositoryNameLabel.text = repository.fullName
        descriptionLabel.text = repository.description
        languageLabel.text = repository.language
        starCountLabel.text = "\(repository.stargazersCount)"
    }
}
