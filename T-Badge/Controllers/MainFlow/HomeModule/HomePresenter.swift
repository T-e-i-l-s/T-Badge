//
//  HomePresenter.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoaded()
}

final class HomePresenter {
    weak var view: HomeViewProtocol?
    var router: HomeRouterInput
    
    private let authManager: AuthManager
    private let networkService: NetworkService

    init(view: HomeViewProtocol, router: HomeRouterInput, authManager: AuthManager, networkService: NetworkService) {
        self.view = view
        self.router = router
        self.authManager = authManager
        self.networkService = networkService
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoaded() {
        // подгрузка контента
        // ... word
        authManager.changeStatus(.auth)
        view?.showInformation(word: "")
    }
}
