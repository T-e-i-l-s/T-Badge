using T_Badge.Models;
using T_Badge.Persistence;

namespace T_Badge.Middlewares.Authentication;

/// <summary>
/// Fetch user's data from token's claims.
/// </summary>
/// <param name="next">Next middleware in pipeline.</param>
public class AuthenticationMiddleware(RequestDelegate next)
{
    public async Task InvokeAsync(
        HttpContext httpContext,
        ApplicationContext db)
    {
        if (!RequiresAuthorization(httpContext))
            goto skip;

        var id = httpContext.User.FindFirst(AuthorizationMetadata.IdClaim)?.Value;
        var username = httpContext.User.FindFirst(AuthorizationMetadata.UsernameClaim)?.Value;
        var role = httpContext.User.FindFirst(AuthorizationMetadata.RoleClaim)?.Value!;
        
        if (int.TryParse(id, out var userId) && !string.IsNullOrEmpty(username))
        {
            var result = new AuthorizationMetadata(
                userId,
                username,
                (Role) Enum.Parse(typeof(Role), role));
            
            AppendAuthenticationResult(httpContext, result);
        }
        
        skip:
        await next(httpContext);
    }
    
    private static bool RequiresAuthorization(HttpContext context)
    {
        return context.Request.Headers.Authorization.Count > 0;
    }

    // Append authentication result (user's fields) to HttpContext item collection.
    private static bool AppendAuthenticationResult(
        HttpContext context,
        AuthorizationMetadata result)
    {
        context.Request.HttpContext.Items.Add(
            AuthorizationMetadata.Key,
            result);

        return true;
    }
}