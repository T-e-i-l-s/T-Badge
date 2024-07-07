using T_Badge;
using T_Badge.Persistence;

var builder = WebApplication.CreateSlimBuilder(args);

builder.Services
    .AddPresentation()
    .AddPersistence(builder.Configuration);

var app = builder.Build();

app.Run();

public record Todo(int Id, string? Title, DateOnly? DueBy = null, bool IsComplete = false);