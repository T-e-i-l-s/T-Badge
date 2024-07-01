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
        var authManager = AuthManager()
        
        let appCoordinator = AppCoordinator(window: window, authManager: authManager)
        return appCoordinator
    }
}
