using EfTestDataStorage.Entities.DocumentEntities;
using EfTestDataStorage.Entities.IdentityEntities;
using EfTestDataStorage.Entities.ProjectEntities;
using EfTestDataStorage.Extensions;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace EfTestDataStorage.EfDbContext
{
    public class AppDbContext : DbContext
    {
        #region DocumentEntities
        public DbSet<DocumentType> DocumentTypes { get; set; }

        public DbSet<EmployeeDocument> EmployeeDocuments { get; set; }
        #endregion

        #region EmployeeEntities
        public DbSet<Employee> Employees { get; set; }

        public DbSet<EmployeePersonalInfo> EmployeePersonalInfos { get; set; }

        public DbSet<Position> Positions { get; set; }

        public DbSet<EmployeeRole> EmployeeRoles { get; set; }

        public DbSet<EmployeeUnit> EmployeeUnits { get; set; }

        public DbSet<Role> Roles { get; set; }

        public DbSet<Unit> Units { get; set; }
        #endregion

        #region ProjectEntities
        public DbSet<Customer> Customers { get; set; }

        public DbSet<Project> Projects { get; set; }

        public DbSet<ProjectEmployee> ProjectEmployees { get; set; }

        public DbSet<ProjectRole> ProjectRoles { get; set; }

        public DbSet<ProjectRoleType> ProjectRoleTypes { get; set; }

        #endregion

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseLazyLoadingProxies();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
            modelBuilder.NamesToSnakeCase();
        }
    }
}
