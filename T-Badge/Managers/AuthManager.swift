//
//  LoginManager.swift
//  T-Badge
//
//  Created by Иван Лукъянычев on 01.07.2024.
//

import UIKit


enum AuthStatus {
    case auth
    case notAuth
}


final class AuthManager {
    private var status: AuthStatus = .notAuth
    
    lazy var cache = DataCache()
    
    init() {
        checkAuth()
    }
    
    private func checkAuth() {
        // TODO: запрос токена при регистрации
    }
    
    func getStatus() -> AuthStatus {
        let isAuth = UserDefaults.standard.bool(forKey: "isAuth")
        if isAuth {
            return .auth
        } else {
            return .notAuth
        }
    }
    
    func changeStatus(_ newStatus: AuthStatus) {
        UserDefaults.standard.setValue((newStatus == .auth), forKey: "isAuth")
        status = newStatus
    }
}
