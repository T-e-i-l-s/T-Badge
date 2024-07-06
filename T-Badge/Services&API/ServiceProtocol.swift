//
//  ServiceProtocol.swift
//  T-Badge
//
//  Created by Petrov Fedor on 05.07.2024.
//

import Foundation

protocol ServiceProtocol {
    var apiAddress: String { get }
}

enum ServiceError: Error {
    case invalidURL
    case missingData
}
