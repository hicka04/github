//
//  RepositoryCodeViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryTreeViewController: UITableViewController {
    
    var presenter: RepositoryCodeViewPresentation!
    
    private var trees: [Tree] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TreeCell.self)
        tableView.register(BlobCell.self)
        
        presenter.viewDidLoad()
    }
}

extension RepositoryTreeViewController: RepositoryCodeView {
    
    func updateTrees(_ trees: [Tree]) {
        self.trees = trees
    }
}

extension RepositoryTreeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tree = trees[indexPath.row]
        switch tree.type {
        case .blob:
            let cell: BlobCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textLabel?.text = tree.path
            return cell
            
        case .tree:
            let cell: TreeCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textLabel?.text = tree.path
            return cell
        }
    }
}
