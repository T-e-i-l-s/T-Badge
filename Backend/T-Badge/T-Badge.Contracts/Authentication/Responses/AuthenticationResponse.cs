namespace T_Badge.Contracts.Authentication.Responses;

public record AuthenticationResponse(
    int Id,
    string Username,
    string Token);