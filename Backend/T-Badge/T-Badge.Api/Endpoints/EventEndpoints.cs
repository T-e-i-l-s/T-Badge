using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using T_Badge.Common.Extensions;
using T_Badge.Common.Policies;
using T_Badge.Contracts.Events.Requests;
using T_Badge.Models;
using T_Badge.Persistence;

namespace T_Badge.Endpoints;

public static class EventEndpoints
{
    public static RouteGroupBuilder MapEventEndpoints(this RouteGroupBuilder group)
    {
        group.MapGet("/", GetEvents).RequireAuthorization(AdminPolicy.Key);
        group.MapGet("/{id:int}", GetEvent).RequireAuthorization();
        group.MapPost("/", CreateEvent).RequireAuthorization();
        group.MapGet("/visit/{eventId:int}", VisitEvent).RequireAuthorization();
        
        return group;
    }
    
    private static async Task<IResult> GetEvents(
        ApplicationContext db)
    {
        return Results.Ok(await db.Events.ToListAsync());
    }
    
    private static async Task<IResult> GetEvent(
        int id,
        ApplicationContext db)
    {
        return await db.Events.FindAsync(id)
            is { } result
                ? Results.Ok(result)
                : Results.NotFound();
    }
    
    private static async Task<IResult> CreateEvent(
        [FromBody] CreateEventRequest request,
        HttpContext context,
        ApplicationContext db)
    {
        var identity = context.GetIdentity();
        var user = await db.Users.FindAsync(identity.Id);
        
        var eventEntity = new Event
        {
            Title = request.Title,
            Description = request.Description,
            Location = request.Location,
            Start = request.Start,
            End = request.End,
            Rating = 0,
            Author = user
        };
        
        db.Events.Add(eventEntity);
        await db.SaveChangesAsync();
        
        return Results.Ok();
    }
    
    private static async Task<IResult> VisitEvent(
        [FromRoute] int eventId,
        ApplicationContext db,
        HttpContext context)
    {
        var identity = context.GetIdentity();

        var user = await db.Users.FindAsync(identity.Id);
        var visitedEvent = await db.Events.FindAsync(eventId);

        user.VisitedEvents.Add(visitedEvent);

        await db.SaveChangesAsync();

        return Results.Ok();
    }
}