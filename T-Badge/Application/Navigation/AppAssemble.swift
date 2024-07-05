//
//  AppAssemble.swift
//  T-Badge
//
//  Created by Иван Лукъянычев on 01.07.2024.
//

import UIKit

final class AppAssemble {
    // TODO: Upload API on PaaS platform.
    static let apiAddress = "http://t-badge.com/api/"
    
    static func assemble(window: UIWindow?) -> FlowCoordinator {
        
        // DI
        let authManager = AuthManager()
        let networkService = NetworkService(apiAddress: apiAddress)
        
        let appCoordinator = AppCoordinator(window: window, authManager: authManager, networkService: networkService)
        
        return appCoordinator
    }
}
