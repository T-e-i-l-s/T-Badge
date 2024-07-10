import Foundation
class AuthStubs {
    func checkAccess(username: String, password: String, result: @escaping (String?) -> ()) {
        guard let url = URL(string: "https://t-badge.onrender.com/api/users/login") else {
            print("Invalid URL")
            return
        }

        let newUser = LoginUserInfo(username: username, password: password)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newUser)
            print(jsonData)
            request.httpBody = jsonData
        } catch {
            print("Error encoding user data: \(error)")
            return
        }

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
                            if let token = json["token"] as? String {
                                result(token)
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
    
    
    func createAccount(name: String, username: String, password: String, result: @escaping (String?) -> ()) {
        guard let url = URL(string: "https://t-badge.onrender.com/api/users/register") else {
            print("Invalid URL")
            return
        }

        let newUser = SignInUserInfo(name: name, username: username, password: password)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newUser)
            request.httpBody = jsonData
        } catch {
            print("Error encoding user data: \(error)")
            return
        }

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
                            if let token = json["token"] as? String {
                                result(token)
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
