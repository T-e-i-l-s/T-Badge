using Microsoft.AspNetCore.Authorization;
using T_Badge.Models;

namespace T_Badge.Common.Policies;

public static class AdminPolicy
{
    public const string Key = nameof(AdminPolicy);
    
    public static AuthorizationBuilder AddAdminPolicy(
        this AuthorizationBuilder builder)
    {
        builder.AddPolicy(Key, policy =>
        {
            policy.RequireRole(Role.Admin.ToString());
        });

        return builder;
    }
}