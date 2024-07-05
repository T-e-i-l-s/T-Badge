//
//  AuthenticationService.swift
//  T-Badge
//
//  Created by Petrov Fedor on 05.07.2024.
//

import Foundation

class AuthenticationService {
    func requestAuth(with password: String,
                     login: String,
                     completion: @escaping (ResultAuth) -> ()) {
        completion(.failed)
    }
}

enum ResultAuth {
    case success
    case failed
    case processed
}
