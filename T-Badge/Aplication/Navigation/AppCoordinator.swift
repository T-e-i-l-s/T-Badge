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
    
    init(window: UIWindow?, authManager: AuthManager) {
        self.window = window
        self.authManager = authManager
    }
    
    func start() {
        switch authManager.getStatus() {
        case .auth:
            window?.rootViewController = HomeAssembly().assemble()
        case .notAuth:
            window?.rootViewController = LoginAssembly().assemble()
        }
    }
}
