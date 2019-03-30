//
//  RepositoryContentListViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit
import entity

final class RepositoryContentListViewController: UITableViewController, RepositoryDetailPageContentView {
    
    var presenter: RepositoryContentListViewPresentation!
    
    private var contents: [RepositoryContent] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(name: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RepositoryContentCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
        
        presenter.viewDidLoad()
    }
}

extension RepositoryContentListViewController: RepositoryContentListView {
    
    func updateContents(_ contents: [RepositoryContent]) {
        self.contents = contents
    }
}

extension RepositoryContentListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = contents[indexPath.row]
        let cell: RepositoryContentCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(content: content)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
