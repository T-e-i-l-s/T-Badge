using Microsoft.EntityFrameworkCore;

namespace T_Badge.Persistence;

public static class DependencyInjection
{
    public static IServiceCollection AddPersistence(
        this IServiceCollection services,
        ConfigurationManager configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        services.AddDbContext<ApplicationContext>(options =>
            options.UseNpgsql(connectionString));
        
        return services;
    }
}