using EfTestDataStorage.Entities.ProjectEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.ProjectEntities
{
    internal class ProjectEmployeeConfiguration : IEntityTypeConfiguration<ProjectEmployee>
    {
        public void Configure(EntityTypeBuilder<ProjectEmployee> builder)
        {
            builder.HasKey(pe => new { pe.ProjectId, pe.EmployeeId });
            builder
                .HasOne(pe => pe.Project)
                .WithMany(r => r.ProjectEmployees)
                .HasForeignKey(pe => pe.ProjectId);

            builder
                .HasOne(pe => pe.Employee)
                .WithMany(e => e.EmployeeProjects)
                .HasForeignKey(pe => pe.EmployeeId);
        }
    }
}
