//
//  LoginPresenter.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

protocol LoginPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

final class LoginPresenter {
    weak var view: LoginViewProtocol?
    
    private let authManager: AuthManager
    private let networkService: NetworkService

    init(view: LoginViewProtocol, authManager: AuthManager, networkService: NetworkService) {
        self.view = view
        self.authManager = authManager
        self.networkService = networkService
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func viewDidLoaded() {
        // first setup view
    }
}
