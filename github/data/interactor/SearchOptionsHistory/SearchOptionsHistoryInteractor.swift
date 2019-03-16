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
    
    func save(keyword: String) throws
}

final class SearchOptionsHistoryInteractor {
    
    private let realm: Realm
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension SearchOptionsHistoryInteractor: SearchOptionsHistoryUsecase {
    
    func save(keyword: String) throws {
        if let history = realm.object(ofType: SearchOptionsHistoryObject.self, forPrimaryKey: keyword) {
            try realm.write {
                history.updateLastSearchDate()
            }
        } else {
            let history = SearchOptionsHistoryObject(keyword: keyword)
            try realm.write {
                realm.add(history)
            }
        }
    }
}

