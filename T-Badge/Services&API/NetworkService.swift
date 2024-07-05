//
//  NetworkService.swift
//  T-Badge
//
//  Created by Иван Лукъянычев on 04.07.2024.
//

import UIKit

// TODO: Maybe make it more cleaner.
final class NetworkService: ServiceProtocol {
    let apiAddress: String
    let userService: UserService
    let badgeService: BadgeService
    let authService: AuthenticationService
    
    init(apiAddress: String) {
        self.apiAddress = apiAddress
        
        userService = UserService()
        badgeService = BadgeService()
        authService = AuthenticationService()
    }
}
