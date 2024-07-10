using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using T_Badge.Common.Interfaces.Authentication;
using T_Badge.Models;

namespace T_Badge.Infrastructure.Authentication;

public class JwtTokenGenerator(IOptions<JwtSettings> options) : IJwtTokenGenerator
{
    private readonly JwtSettings _options = options.Value;
    
    public string GenerateToken(User user)
    {
        var secretKey = Encoding.UTF8.GetBytes(_options.Secret);
        
        var signingCredentials = new SigningCredentials(
            new SymmetricSecurityKey(secretKey),
            SecurityAlgorithms.HmacSha256
        );

        var tokenHandler = new JwtSecurityTokenHandler();

        var claims = new[]
        {
            new Claim(ClaimTypes.Sid, user.Id.ToString()),
            new Claim(ClaimTypes.Name, user.Name),
            new Claim(ClaimTypes.Role, user.Role.ToString()),
            new Claim(ClaimTypes.NameIdentifier, user.Username)
        };
        
        // TODO: Rewrite this shit.
        // var securityToken = tokenHandler.CreateJwtSecurityToken(
        //     new SecurityTokenDescriptor
        //     {
        //         Issuer = _options.Issuer,
        //         Audience = _options.Audience,
        //         Subject = new ClaimsIdentity(claims),
        //         Expires = DateTime.UtcNow.AddMinutes(_options.ExpiryMinutes),
        //         SigningCredentials = signingCredentials
        //     }
        // );
        
        var securityToken = new JwtSecurityToken(
            issuer: _options.Issuer,
            audience: _options.Audience,
            expires: DateTime.UtcNow.AddMinutes(_options.ExpiryMinutes),
            claims: claims,
            signingCredentials: signingCredentials);
        
        return tokenHandler.WriteToken(securityToken);
    }
}