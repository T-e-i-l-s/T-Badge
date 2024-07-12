import Foundation

let url = "http://147.45.253.29/api"

class EventsStubs {
    let authToken: String
    
    init(authToken: String) {
        self.authToken = authToken
    }
    
    func getEvents(result: @escaping ([EventModel]?) -> ()) {
        guard let url = URL(string: "\(url)/users/me") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")

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
                            if let eventsArray = json["visitedEvents"] as? [[String: Any]] {
                                let events = eventsArray.compactMap { eventDict -> EventModel? in
                                    if let id = eventDict["id"] as? Int ,
                                       let title = eventDict["title"] as? String,
                                       let description = eventDict["description"] as? String,
                                       let location = eventDict["location"] as? String,
                                       let start = eventDict["start"] as? Int64,
                                       let end = eventDict["end"] as? Int64 {
                                        return EventModel(id: id, name: title, description: description, place: location, start: start, end: end)
                                    }
                                    return nil
                                }
                                result(events)
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
    
    func visitEvent(index: String, result: @escaping (Bool) -> ()) {
        guard let url = URL(
            string: "\(url)/users/visit/\(index)"
        ) else {
            print("Invalid URL")
            result(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error making POST request: \(error)")
                result(false)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode != 200 {
                    result(false)
                } else {
                    result(true)
                }
            } else {
                result(true)
            }
        }
        
        task.resume()
    }
    
}

