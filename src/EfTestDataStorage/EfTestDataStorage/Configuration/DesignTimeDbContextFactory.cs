using EfTestDataStorage.EfDbContext;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace EfTestDataStorage.Configuration
{
    public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
    {
        public AppDbContext CreateDbContext(string[] args)
        {
            string projectPath = Directory.GetCurrentDirectory();
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(projectPath)
                .AddJsonFile("dbconfiguration.json")
                .Build();
            string connectionString = configuration.GetConnectionString("PostgreConnectionString");

            var builder = new DbContextOptionsBuilder<AppDbContext>();
            builder.UseNpgsql(connectionString);

            return new AppDbContext(builder.Options);
        }
    }
}
