namespace T_Badge.Contracts.Events.Requests;

public record CreateEventRequest(
    string Title,
    string Description,
    string Location,
    DateTime Start,
    DateTime End);