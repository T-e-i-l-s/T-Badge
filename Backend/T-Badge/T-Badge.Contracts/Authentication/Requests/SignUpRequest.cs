namespace T_Badge.Contracts.Authentication.Requests;

public record SignUpRequest(
    string Name,
    string Username,
    string Password);