import Foundation

class UserStubs {
    let authToken: String
    
    init(authToken: String) {
        self.authToken = authToken
    }
    
    func getEvents(result: @escaping (UserInfo?) -> ()) {
        guard let url = URL(string: "https://t-badge.onrender.com/api/users/me") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")  // Добавляем токен в заголовок

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error making GET request: \(error)")
                return
            }

            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                if let jsonData = responseString!.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            if let name = json["name"] as? String,
                               let achievementsArray = json["achievements"] as? [[String: Any]] {
                                let achievements = achievementsArray.compactMap { achievementDict -> AchievmentModel? in
                                    if let title = achievementDict["title"] as? String {
                                        return AchievmentModel(image: title == "Новичок" ? "🥳" : title == "Бывалый" ? "🏆" : title == "Диванный эксперт" ? "🥸" : "😎", name: title)
                                    }
                                    return nil
                                }
                                result(UserInfo(name: name, achievements: achievements))
                            } else {
                                result(nil)
                            }
                        } else {
                            result(nil)
                        }
                    } catch {
                        result(nil)
                    }
                } else {
                    result(nil)
                }
            }
        }

        task.resume()
    }
}

// Будем потом подгружать из апи
struct AchievmentModel {
    let image: String
    let name: String
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}

struct UserInfo {
    let name: String
    let achievements: [AchievmentModel]
    
    init (name: String, achievements: [AchievmentModel]) {
        self.name = name
        self.achievements = achievements
    }
}
