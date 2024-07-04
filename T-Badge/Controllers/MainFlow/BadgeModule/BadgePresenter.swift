//
//  BadgePresenter.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

protocol BadgePresenterProtocol: AnyObject {
    func viewDidLoaded()
}

final class BadgePresenter {
    weak var view: BadgeViewProtocol?
    
    
    private let authManager: AuthManager
    private let networkService: NetworkService

    init(view: BadgeViewProtocol?, authManager: AuthManager, networkService: NetworkService) {
        self.view = view
        self.authManager = authManager
        self.networkService = networkService
    }
}

extension BadgePresenter: BadgePresenterProtocol {
    func viewDidLoaded() {
        // first setup view
    }
}
