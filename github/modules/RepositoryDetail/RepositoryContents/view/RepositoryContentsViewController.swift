//
//  RepositoryCodeViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryContentsViewController: UITableViewController {
    
    var presenter: RepositoryContentsViewPresentation!
    
    private var contents: [RepositoryContent] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(path: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = path
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DirCell.self)
        tableView.register(FileCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
        
        presenter.viewDidLoad()
    }
}

extension RepositoryContentsViewController: RepositoryContentsView {
    
    func updateContents(_ contents: [RepositoryContent]) {
        self.contents = contents
    }
}

extension RepositoryContentsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = contents[indexPath.row]
        switch content.type {
        case .file:
            let cell: FileCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textLabel?.text = content.path
            return cell
            
        case .dir:
            let cell: DirCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textLabel?.text = content.path
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
