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
        if let window {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        switch authManager.getStatus() {
        case .auth:
            window?.rootViewController = TabBarController(authManager: authManager) { [weak self] in
                self?.start()
            }
        case .notAuth:
            let vc = LoginViewController(authManager: authManager) { [weak self] in
                self?.start()
            }
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
    }
}
