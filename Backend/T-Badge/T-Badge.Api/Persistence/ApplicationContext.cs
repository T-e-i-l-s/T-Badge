using Microsoft.EntityFrameworkCore;
using T_Badge.Models;

namespace T_Badge.Persistence;

public class ApplicationContext(DbContextOptions<ApplicationContext> options) : DbContext(options)
{
    public DbSet<User> Users { get; set; }
    public DbSet<Event> Events { get; set; }
    public DbSet<Achievement> Achievements { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .Entity<User>()
            .HasMany(t => t.VisitedEvents)
            .WithMany(t => t.VisitedBy);

        modelBuilder
            .Entity<User>()
            .OwnsMany(t => t.Achievements)
            .WithOwner(t => t.Owner);

        // TODO: Uncomment and make migrations.
        modelBuilder
            .Entity<Event>()
            .HasOne(t => t.Author)
            .WithMany(t => t.CreatedEvents);
    }
}