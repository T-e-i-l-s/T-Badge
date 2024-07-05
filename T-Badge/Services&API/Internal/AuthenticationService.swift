//
//  AuthenticationService.swift
//  T-Badge
//
//  Created by Petrov Fedor on 05.07.2024.
//

import Foundation

final class AuthenticationService: ServiceProtocol {
    let apiAddress: String
    
    init(apiAddress: String) {
        self.apiAddress = apiAddress
    }
    
    func authenticate(login: String,
                      password: String) async throws -> [UserModel]? {
        return nil
    }
    
//    func requestAuth(with password: String,
//                     login: String,
//                     completion: @escaping (ResultAuth) -> ()) {
//        completion(.failed)
//    }
}

enum ResultAuth {
    case success
    case failed
    case processed
}
