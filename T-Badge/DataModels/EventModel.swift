struct EventModel {
    var id: Int
    var name: String
    var description: String
    var place: String
    var start: String
    var end: String
    
    init(id: Int, name: String, description: String, place: String, start: String, end: String) {
        self.id = id
        self.name = name
        self.description = description
        self.place = place
        self.start = start
        self.end = end
    }
}
