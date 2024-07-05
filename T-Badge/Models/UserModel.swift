//
//  UserModel.swift
//  T-Badge
//
//  Created by Petrov Fedor on 05.07.2024.
//

import Foundation

struct UserModel {
    var id: Int
    var name: String
    var status: String
    var achievements: [AchievementModel]
    var visitedPlaces: [EventModel]
}
