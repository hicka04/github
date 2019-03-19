//
//  SearchOptionsViewPresenter.swift
//  github
//
//  Created by hikaru on 2019/3/17.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation

protocol SearchOptionsViewPresentation: AnyObject {

    func viewDidLoad()
    func searchBarTextDidBeginEditing()
    func searchBarSearchButtonClicked(_ searchBarText: String)
    func searchBarSearchButtonClicked()
}


final class SearchOptionsViewPresenter {

    private weak var view: SearchOptionsView?
    private let router: SearchOptionsWireframe
    private let historyInteractor: SearchOptionsHistoryUsecase
    
    init(view: SearchOptionsView,
         router: SearchOptionsWireframe,
         historyInteractor: SearchOptionsHistoryUsecase) {
        self.view = view
        self.router = router
        self.historyInteractor = historyInteractor
    }
}

extension SearchOptionsViewPresenter: SearchOptionsViewPresentation {
    
    func viewDidLoad() {
        guard let lastKeyword = historyInteractor.lastSearchOptions()?.keyword else {
            return
        }
        view?.setLastSearchKeyword(lastKeyword)
    }
    
    func searchBarTextDidBeginEditing() {
        router.moveToFull()
    }
    
    func searchBarSearchButtonClicked(_ searchBarText: String) {
        try? historyInteractor.save(searchOptions: SearchOptions(keyword: searchBarText))
        router.moveToTip()
    }
    
    func searchBarSearchButtonClicked() {
        router.moveToHalf()
    }
}

