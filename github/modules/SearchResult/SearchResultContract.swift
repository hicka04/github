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
    func showSearchErrorAlert()
}

extension SearchResultView where Self: UIViewController {
    
    func showSearchErrorAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "エラー",
                                          message: "検索に失敗しました。時間をおいて再度お試しください。",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

protocol SearchResultViewPresentation: AnyObject {
    
    func viewDidLoad()
    func refreshControlDidRefresh()
    func didSelectRow(at indexPath: IndexPath)
}
