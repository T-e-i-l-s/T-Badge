using T_Badge.Common.Interfaces.Authentication;

namespace T_Badge.Infrastructure.Authentication;

public class PasswordVerifier : IPasswordVerifier
{
    public bool Verify(string password, string hash) 
        => BCrypt.Net.BCrypt.Verify(password, hash);

    public string Hash(string password) 
        => BCrypt.Net.BCrypt.HashPassword(password);
}