import Foundation
class UserStubs {
    func getEvents (result: @escaping (UserInfo?) -> ()) {
        guard let url = URL(string: "https://t-badge.onrender.com/api/users/me") else {
            print("Invalid URL")
            return
        }
        
//        let authToken = "Bearer \(String(describing: KeychainManager.shared.getKey()))"
        let authToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiIyNiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJLYXJpbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6InRlaWxzMiIsImV4cCI6MTcyMDYzNzk2MywiaXNzIjoiVC1CYWRnZS5BcGkiLCJhdWQiOiJULUJhZGdlLkFwaSJ9.Wo8AQ7bq4WsNcPOBue0EobdeQhR1ReW-rc5d0WS3YPk"

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(authToken, forHTTPHeaderField: "Authorization")  // Добавляем токен в заголовок

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error making POST request: \(error)")
                return
            }

            if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                if let jsonData = responseString!.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            if let name = json["name"] as? String {
                                result(
                                    UserInfo(name: name, achievements: [
                                        AchievmentModel(image: "achievement1", name: "Чел хорош"),
                                        AchievmentModel(image: "achievement2", name: "Чел мегахорош")
                                    ])
                                )
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
