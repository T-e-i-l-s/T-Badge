//
//  UserModel.swift
//  T-Badge
//
//  Created by Petrov Fedor on 05.07.2024.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let name: String
    let status: String
    let achievements: [AchievementModel]
    let visitedPlaces: [EventModel]
}
