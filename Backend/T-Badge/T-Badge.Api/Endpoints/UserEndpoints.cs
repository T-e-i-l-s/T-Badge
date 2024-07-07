namespace T_Badge.Endpoints;

public static class UserEndpoints
{
    public static RouteGroupBuilder MapUserEndpoints(this RouteGroupBuilder group)
    {
        group.MapGet("/users", GetUsers);
        group.MapGet("/users/{id}", GetUser);
        group.MapPost("/users", CreateUser);
        group.MapPut("/users/{id}", UpdateUser);
        group.MapDelete("/users/{id}", DeleteUser);

        return group;
    }
    
    
}