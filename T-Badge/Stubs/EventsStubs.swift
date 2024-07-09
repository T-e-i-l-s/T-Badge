class EventsStubs {
    func getEvents () -> [EventModel] {
        // Данные, которые потом надо будет брать из API
        let event1 = EventModel(id: 123, name: "Workshop", description: "Description of this event", place: "НИУ ВШЭ", start: "14:00", end: "16:00")
        let eventsArray = [event1, event1, event1, event1, event1, event1, event1]
        return eventsArray
    }
}
