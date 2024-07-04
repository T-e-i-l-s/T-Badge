//
//  HomeAssembly.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

final class HomeAssembly {
    
    private let authManager: AuthManager
    private let networkService: NetworkService
    
    init(authManager: AuthManager, networkService: NetworkService) {
        self.authManager = authManager
        self.networkService = networkService
    }
    
    func assemble() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter(view: viewController, authManager: authManager, networkService: networkService)
        
        viewController.presenter = presenter
        
        return viewController
    }
    
}
