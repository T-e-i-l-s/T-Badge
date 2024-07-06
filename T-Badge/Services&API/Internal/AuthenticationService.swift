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
                      password: String) async throws -> AuthenticationModel {
        guard let url = URL(string: apiAddress) else {
            throw ServiceError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let authenticationResult = try JSONDecoder().decode(
            AuthenticationModel.self,
            from: data
        )
        
        return authenticationResult
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
