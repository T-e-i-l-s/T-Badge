//
//  AppAssemble.swift
//  T-Badge
//
//  Created by Иван Лукъянычев on 01.07.2024.
//

import UIKit

final class AppAssemble {
    static func assemble(window: UIWindow?) -> FlowCoordinator {
        
        // DI
        let networkService = NetworkService()
        let authManager = AuthManager(networkService: networkService)
        
        let appCoordinator = AppCoordinator(window: window, authManager: authManager, networkService: networkService)
        return appCoordinator
    }
}
