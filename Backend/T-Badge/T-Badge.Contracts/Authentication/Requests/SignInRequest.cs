namespace T_Badge.Contracts.Authentication.Requests;

public record SignInRequest(
    string Username,
    string Password);