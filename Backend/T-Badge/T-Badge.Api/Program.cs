using T_Badge;
using T_Badge.Endpoints;
using T_Badge.Infrastructure;

var builder = WebApplication.CreateSlimBuilder(args);

builder.Services
    .AddPresentation()
    .AddInfrastructure(builder.Configuration);

var app = builder.Build();

var api = app.MapGroup("/api");

api
    .MapGroup("/users")
    .MapUserEndpoints();

app.Run();