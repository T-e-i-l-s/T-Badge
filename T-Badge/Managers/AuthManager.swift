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
    
    private let networkService: NetworkService
    
    private var status: AuthStatus = .notAuth

    init(networkService: NetworkService) {
        self.networkService = networkService
        checkAuth()
    }
    
    private func checkAuth() {
        if KeychainManager.shared.getKey() != nil {
            status = .auth
        } else {
            status = .notAuth
        }
    }
    
    public func getStatus() -> AuthStatus {
        return status
    }
    
    public func changeStatus(_ newStatus: AuthStatus, token: String? = nil) {
        switch newStatus {
        case .auth:
            if let token = token {
                KeychainManager.shared.saveKey(token)
                status = newStatus
                // TODO: added key to network service
                // networkService.token = ...
            } else {
                print("error AuthManager save key")
            }
        case .notAuth:
            KeychainManager.shared.clearKey()
            status = newStatus
        }
    }
}
