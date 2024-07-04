//
//  BadgeAssembly.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

final class BadgeAssembly {
    
    private let authManager: AuthManager
    private let networkService: NetworkService
    
    init(authManager: AuthManager, networkService: NetworkService) {
        self.authManager = authManager
        self.networkService = networkService
    }
    
    func assemble() -> BadgeViewController {
        let router = BadgeRouter()
        let viewController = BadgeViewController()
        let presenter = BadgePresenter(view: viewController, router: router, authManager: authManager, networkService: networkService)
        
        viewController.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
}
