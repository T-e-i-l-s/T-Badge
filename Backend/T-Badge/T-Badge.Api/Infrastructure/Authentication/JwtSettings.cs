namespace T_Badge.Infrastructure.Authentication;

public record JwtSettings(
    string Secret,
    string Issuer,
    string Audience,
    int ExpiryMinutes)
{
    public const string SectionName = "JwtSettings";
    public static JwtSettings Default => new(
        Secret: "default_secret",
        Issuer: "default_issuer",
        Audience: "default_audience",
        ExpiryMinutes: 15);
}