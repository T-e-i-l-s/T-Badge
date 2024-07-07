using T_Badge;
using T_Badge.Endpoints;
using T_Badge.Infrastructure;
using T_Badge.Middlewares;

var builder = WebApplication.CreateSlimBuilder(args);

builder.Services
    .AddPresentation()
    .AddInfrastructure(builder.Configuration);

var app = builder.Build();

app.UseMiddleware<AuthenticationMiddleware>();

var api = app.MapGroup("/api");

api
    .MapGroup("/users")
    .MapUserEndpoints();

app.Run();