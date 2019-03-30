//
//  SearchOptionsHistoryInteractor.swift
//  github
//
//  Created by hikaru on 2019/3/16.
//  Copyright © 2019 hikaru. All rights reserved.
//

import Foundation
import RealmSwift
import entity

public protocol SearchOptionsHistoryUsecase {
    
    func save(searchOptions: SearchOptions) throws
    func latestSearchOptions() -> SearchOptions?
    func observe(latestSearchOptions: @escaping (SearchOptions?) -> Void)
}

public final class SearchOptionsHistoryInteractor {
    
    private let realm: Realm
    private var token: NotificationToken?
    
    public convenience init() {
        self.init(realm: try! Realm())
    }
    
    init(realm: Realm) {
        self.realm = realm
    }
}

extension SearchOptionsHistoryInteractor: SearchOptionsHistoryUsecase {
    
    public func save(searchOptions: SearchOptions) throws {
        if let history = realm.objects(SearchOptionsHistoryObject.self)
                            .filter("searchOptions.keyword = %@ AND searchOptions.searchType = %@ AND searchOptions.language = %@", searchOptions.keyword, searchOptions.searchType.rawValue, searchOptions.language?.rawValue ?? "nil").first {
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
    
    public func latestSearchOptions() -> SearchOptions? {
        guard let object = realm.objects(SearchOptionsHistoryObject.self)
                            .sorted(byKeyPath: "lastSearchAt")
                            .last?
                            .searchOptions else {
            return nil
        }
        
        return SearchOptions(object: object)
    }
    
    public func observe(latestSearchOptions: @escaping (SearchOptions?) -> Void) {
        token = realm.objects(SearchOptionsHistoryObject.self).sorted(byKeyPath: "lastSearchAt").observe { change in
            switch change {
            case .initial(let histories),
                 .update(let histories, _, _, _):
                guard let last = histories.last?.searchOptions else {
                    return
                }
                latestSearchOptions(SearchOptions(object: last))
            default: break
            }
        }
    }
}

