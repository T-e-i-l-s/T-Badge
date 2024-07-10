using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using T_Badge.Common.Interfaces.Authentication;
using T_Badge.Common.Policies;
using T_Badge.Infrastructure.Authentication;
using T_Badge.Persistence;

namespace T_Badge.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(
        this IServiceCollection services,
        ConfigurationManager configuration)
    {
        services
            .AddPersistence(configuration)
            .AddDefaultAuthentication(configuration);
        
        services.AddSingleton<IPasswordVerifier, PasswordVerifier>();
        
        return services;
    }

    private static IServiceCollection AddDefaultAuthentication(
        this IServiceCollection services,
        ConfigurationManager configuration)
    {
        services.AddSingleton<IJwtTokenGenerator, JwtTokenGenerator>();

        // MARK: Maybe it will raise error.
        var jwtSettings = JwtSettings.Default;
        configuration.Bind(JwtSettings.SectionName, jwtSettings);

        services.AddSingleton(Options.Create(jwtSettings));

        services
            .AddAuthentication(defaultScheme: JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new()
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = jwtSettings.Issuer,
                    ValidAudience = jwtSettings.Audience,
                    IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(jwtSettings.Secret))
                };
                
            });

        services
            .AddAuthorization()
            .AddAuthorizationBuilder()
            .AddAdminPolicy();
        
        return services;
    }
}