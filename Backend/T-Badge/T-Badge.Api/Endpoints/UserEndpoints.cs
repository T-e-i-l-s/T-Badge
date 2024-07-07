using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using T_Badge.Common.Interfaces.Authentication;
using T_Badge.Contracts.Authentication.Requests;
using T_Badge.Contracts.Authentication.Responses;
using T_Badge.Models;
using T_Badge.Persistence;

namespace T_Badge.Endpoints;

public static class UserEndpoints
{
    public static RouteGroupBuilder MapUserEndpoints(this RouteGroupBuilder group)
    {
        group.MapGet("/users", GetUsers).RequireAuthorization();
        group.MapGet("/users/{id:int}", GetUser).RequireAuthorization();
        group.MapPost("/users/login", SignIn);
        group.MapPost("/users/register", SignUp);

        return group;
    }
    
    private static async Task<IResult> GetUsers(
        [FromServices] ApplicationContext db)
    {
        return Results.Ok(await db.Users.ToListAsync());
    }
    
    private static async Task<IResult> GetUser(
        [FromRoute] int id,
        [FromServices] ApplicationContext db)
    {
        return Results.Ok(await db.Users.FindAsync(id));
    }
    
    private static async Task<IResult> SignIn(
        [FromBody] SignInRequest request,
        [FromServices] ApplicationContext db,
        [FromServices] IPasswordVerifier passwordVerifier,
        [FromServices] IJwtTokenGenerator tokenGenerator)
    {
        var user = await db.Users
            .FirstOrDefaultAsync(x => x.Username == request.Username);
        
        if (user is null)
            return Results.NotFound();
        
        if (!passwordVerifier.Verify(request.Password, user.Password))
            return Results.Unauthorized();
        
        var jwtToken = tokenGenerator.GenerateToken(user);
        
        return Results.Ok(new AuthenticationResponse(
            user.Id,
            user.Username,
            jwtToken));
    }
    
    private static async Task<IResult> SignUp(
        [FromBody] SignUpRequest request,
        [FromServices] ApplicationContext db,
        [FromServices] IPasswordVerifier passwordVerifier,
        [FromServices] IJwtTokenGenerator tokenGenerator)
    {
        if (await db.Users.AnyAsync(x => x.Username == request.Username))
            return Results.BadRequest();
        
        var user = new User
        {
            Name = request.Name,
            Username = request.Username,
            Password = passwordVerifier.Hash(request.Password)
        };
        
        var createdUser = db.Users.Add(user).Entity;
        await db.SaveChangesAsync();

        var jwtToken = tokenGenerator.GenerateToken(createdUser);
        
        return Results.Ok(new AuthenticationResponse(
            createdUser.Id,
            createdUser.Username,
            jwtToken));
    }
}