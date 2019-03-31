//
//  SearchResultContainerRouter.swift
//  github
//
//  Created by hikaru on 2019/3/21.
//  Copyright © 2019 hikaru. All rights reserved.
//

import UIKit
import FloatingPanel
import data

protocol SearchResultContainerWireframe: AnyObject {
    
    func showSearchOptionsView()
    func showRepositorySearchResultView()
    func showUserSearchResultView()
}

final class SearchResultContainerRouter {
    
    private unowned let viewController: UIViewController
    
    private let floatingPanelController: FloatingPanelController = {
        let floatingPanelController = FloatingPanelController()
        floatingPanelController.surfaceView.cornerRadius = 16
        return floatingPanelController
    }()
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = SearchResultContainerViewController()
        let router = SearchResultContainerRouter(viewController: view)
        let interactor = SearchOptionsHistoryInteractor()
        let presenter = SearchResultContainerViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
    
    private func changeSearchResultView(_ searchResultView: UIViewController) {
        viewController.children.dropFirst().forEach { child in
            child.willMove(toParent: viewController)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        viewController.addChild(searchResultView)
        viewController.view.insertSubview(searchResultView.view, at: 0)
        searchResultView.didMove(toParent: viewController)
        
        searchResultView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchResultView.view.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            searchResultView.view.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            searchResultView.view.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            searchResultView.view.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.bottomAnchor, constant: -70)
            ])
    }
}

extension SearchResultContainerRouter: SearchResultContainerWireframe {
    
    func showSearchOptionsView() {
        let searchOptionsView = SearchOptionsRouter.assembleModules(floatingPanelController: floatingPanelController)
        floatingPanelController.set(contentViewController: searchOptionsView)
        floatingPanelController.addPanel(toParent: viewController)
        floatingPanelController.move(to: .tip, animated: false)
    }
    
    func showRepositorySearchResultView() {
        let repositorySearchResultView = RepositorySearchResultRouter.assembleModules()
        changeSearchResultView(repositorySearchResultView)
    }
    
    func showUserSearchResultView() {
        let userSearchResultView = UserSearchResultRouter.assembleModules()
        changeSearchResultView(userSearchResultView)
    }
}
