struct EventModel {
    var id: Int
    var name: String
    var description: String
    var place: String
    var start: Int64
    var end: Int64
    
    init(id: Int, name: String, description: String, place: String, start: Int64, end: Int64) {
        self.id = id
        self.name = name
        self.description = description
        self.place = place
        self.start = start
        self.end = end
    }
}
