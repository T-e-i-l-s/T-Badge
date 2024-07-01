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
    
    init() {
        checkAuth()
    }
    
    private func checkAuth() {
        
    }
    
    func getStatus() -> AuthStatus {
        return status
    }
    
    func changeStatus(_ newStatus: AuthStatus) {
        status = newStatus
    }
}
