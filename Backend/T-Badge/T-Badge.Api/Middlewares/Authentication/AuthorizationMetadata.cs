using System.Security.Claims;
using T_Badge.Models;

namespace T_Badge.Middlewares.Authentication;

public record AuthorizationMetadata(
    int Id,
    string Username,
    Role Role)
{
    public const string Key = nameof(AuthorizationMetadata);
    public const string IdClaim = ClaimTypes.Sid;
    public const string UsernameClaim = ClaimTypes.NameIdentifier;
    public const string RoleClaim = ClaimTypes.Role;
}