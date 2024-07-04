//
//  AppCoordinator.swift
//  T-Badge
//
//  Created by Иван Лукъянычев on 01.07.2024.
//

import UIKit

final class AppCoordinator: FlowCoordinator {
    
    private weak var window: UIWindow?
    
    private let authManager: AuthManager
    private let networkService: NetworkService
    
    init(window: UIWindow?, authManager: AuthManager, networkService: NetworkService) {
        self.window = window
        self.authManager = authManager
        self.networkService = networkService
    }
    
    
    func start() {
        switch authManager.getStatus() {
        case .auth:
            window?.rootViewController = HomeAssembly(authManager: authManager, networkService: networkService).assemble()
        case .notAuth:
            window?.rootViewController = LoginAssembly(authManager: authManager, networkService: networkService).assemble()
        }
    }
}
