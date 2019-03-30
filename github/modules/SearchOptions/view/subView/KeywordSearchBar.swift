//
//  KeywordSearchBar.swift
//  github
//
//  Created by hicka04 on 2019/03/24.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

class KeywordSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = self
    }
    
    private var handlers: [Event: EventHandler] = [:]
    
    func on(_ event: Event, handler: @escaping EventHandler) {
        handlers.updateValue(handler, forKey: event)
    }
}

extension KeywordSearchBar: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        handlers[.textDidBeginEditing]?(self)
        setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        setShowsCancelButton(false, animated: true)
        if isFirstResponder {
            resignFirstResponder()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        handlers[.searchButtonClicked]?(self)
        setShowsCancelButton(false, animated: true)
        resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        handlers[.cancelButtonClicked]?(self)
        setShowsCancelButton(false, animated: true)
        resignFirstResponder()
    }
}

extension KeywordSearchBar {
    
    enum Event {
        case textDidBeginEditing
        case searchButtonClicked
        case cancelButtonClicked
    }
    
    typealias EventHandler = (KeywordSearchBar) -> Void
}
