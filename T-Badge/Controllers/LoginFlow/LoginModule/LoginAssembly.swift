//
//  LoginAssembly.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

final class LoginAssembly {
    
    private let authManager: AuthManager
    private let networkService: NetworkService
    
    init(authManager: AuthManager, networkService: NetworkService) {
        self.authManager = authManager
        self.networkService = networkService
    }
    
    func assemble() -> LoginViewController {
        let router = LoginRouter()
        let viewController = LoginViewController()
        let presenter = LoginPresenter(view: viewController, router: router, authManager: authManager, networkService: networkService)
        
        viewController.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
}
