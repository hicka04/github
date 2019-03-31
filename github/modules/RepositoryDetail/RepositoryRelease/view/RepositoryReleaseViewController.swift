//
//  RepositoryReleaseViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/25.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import entity

final class RepositoryReleaseViewController: UITableViewController, RepositoryDetailPageContentView {

    var presenter: RepositoryReleaseViewPresentation!
    
    private var releases: [Release] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ReleaseCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
        
        presenter.viewDidLoad()
    }
}

extension RepositoryReleaseViewController: RepositoryReleaseView {
    
    func updateReleases(_ releases: [Release]) {
        self.releases = releases
    }
}

extension RepositoryReleaseViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return releases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReleaseCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(release: releases[indexPath.row])
        return cell
    }
}
