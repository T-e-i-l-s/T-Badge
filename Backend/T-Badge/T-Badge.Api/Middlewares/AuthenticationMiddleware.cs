using T_Badge.Contracts.Authentication.Responses;
using T_Badge.Persistence;

namespace T_Badge.Middlewares;

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

        var id = httpContext.User.FindFirst(AuthenticationResponse.IdClaim)?.Value;
        var username = httpContext.User.FindFirst(AuthenticationResponse.UsernameClaim)?.Value;

        if (int.TryParse(id, out var userId) && !string.IsNullOrEmpty(username))
        {
            var result = new AuthenticationResponse(
                userId,
                username,
                string.Empty);
            
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
        AuthenticationResponse result)
    {
        context.Request.HttpContext.Items.Add(
            AuthenticationResponse.Key,
            result);

        return true;
    }
}