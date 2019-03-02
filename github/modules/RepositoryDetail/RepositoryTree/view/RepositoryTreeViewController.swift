//
//  RepositoryCodeViewController.swift
//  github
//
//  Created by hicka04 on 2019/02/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

final class RepositoryTreeViewController: UITableViewController {
    
    var presenter: RepositoryTreeViewPresentation!
    
    private var trees: [Tree] = [] {
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
        
        tableView.register(TreeCell.self)
        tableView.register(BlobCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
        
        presenter.viewDidLoad()
    }
}

extension RepositoryTreeViewController: RepositoryTreeView {
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
