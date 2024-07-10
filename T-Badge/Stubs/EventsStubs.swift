class EventsStubs {
    func getEvents () -> [EventModel] {
        // Данные, которые потом надо будет брать из API
        let event1 = EventModel(id: 123, name: "ЛШПИ", description: "Description of this event", place: "НИУ ВШЭ", start: 1719781200, end: 1720731600)
        let event2 = EventModel(id: 123, name: "Отбор на ЛШПИ", description: "Description of this event", place: "НИУ ВШЭ", start: 1717016400, end: 1719694800)
        let eventsArray = [event1, event1, event1, event2, event2, event2, event2]
        return eventsArray
    }
}
