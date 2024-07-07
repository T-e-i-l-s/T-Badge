using System.ComponentModel.DataAnnotations;

namespace T_Badge.Models;

public class User
{
    [Key]
    public int Id { get; set; }
    public string? Name { get; set; }
    public Status Status { get; set; }
    public Role Role { get; set; }
    public List<Achievement> Achievements { get; set; } = [];
    public List<Event> VisitedEvents { get; set; } = [];
}

public enum Status
{
    Novice,
    Beginner,
    Intermediate,
    Expert,
    Grandmaster
}

public enum Role
{
    User,
    Admin
}