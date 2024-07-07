namespace T_Badge.Contracts.Authentication.Responses;

public record AuthenticationResponse(
    int Id,
    string Username,
    string Token)
{
    public const string Key = nameof(AuthenticationResponse);
    public const string IdClaim = "identity";
    public const string UsernameClaim = "username";
}