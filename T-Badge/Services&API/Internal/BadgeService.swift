//
//  BadgeService.swift
//  T-Badge
//
//  Created by Petrov Fedor on 05.07.2024.
//

import Foundation

final class BadgeService: ServiceProtocol {
    let apiAddress: String
    
    init(apiAddress: String) {
        self.apiAddress = apiAddress
    }
}
