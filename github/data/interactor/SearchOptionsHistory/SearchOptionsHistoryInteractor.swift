//
//  SearchOptionsHistoryInteractor.swift
//  github
//
//  Created by hikaru on 2019/3/16.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import RealmSwift

protocol SearchOptionsHistoryUsecase {
    
    func save(searchOptions: SearchOptions) throws
    func lastSearchOptions() -> SearchOptions?
    func observe(lastSearchOptions: @escaping (SearchOptions?) -> Void)
}

final class SearchOptionsHistoryInteractor {
    
    private let realm: Realm
    private var token: NotificationToken?
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension SearchOptionsHistoryInteractor: SearchOptionsHistoryUsecase {
    
    func save(searchOptions: SearchOptions) throws {
        if let history = realm.objects(SearchOptionsHistoryObject.self)
                            .filter("searchOptions.keyword = %@ AND searchOptions.searchType = %@", searchOptions.keyword, searchOptions.searchType.rawValue).first {
            try realm.write {
                history.updateLastSearchDate()
            }
        } else {
            let history = SearchOptionsHistoryObject(searchOptions: searchOptions.object())
            try realm.write {
                realm.add(history)
            }
        }
    }
    
    func lastSearchOptions() -> SearchOptions? {
        guard let object = realm.objects(SearchOptionsHistoryObject.self)
                            .sorted(byKeyPath: "lastSearchAt")
                            .last?
                            .searchOptions else {
            return nil
        }
        
        return SearchOptions(object: object)
    }
    
    func observe(lastSearchOptions: @escaping (SearchOptions?) -> Void) {
        token = realm.objects(SearchOptionsHistoryObject.self).sorted(byKeyPath: "lastSearchAt").observe { change in
            switch change {
            case .initial(let histories),
                 .update(let histories, _, _, _):
                guard let last = histories.last?.searchOptions else {
                    return
                }
                lastSearchOptions(SearchOptions(object: last))
            default: break
            }
        }
    }
}

