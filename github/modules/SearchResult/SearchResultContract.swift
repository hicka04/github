//
//  SearchResultContract.swift
//  github
//
//  Created by hicka04 on 2019/03/22.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

protocol SearchResultView: AnyObject {
    
    associatedtype Result
    
    func updateSearchResults(_ results: [Result])
    func scrollToTop()
}

extension SearchResultView where Self: UITableViewController {
    
    func scrollToTop() {
        DispatchQueue.main.async {
            self.tableView.setContentOffset(.zero, animated: true)
        }
    }
}
