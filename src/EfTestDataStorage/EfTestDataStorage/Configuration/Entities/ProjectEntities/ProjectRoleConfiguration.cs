using EfTestDataStorage.Entities.ProjectEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
namespace EfTestDataStorage.Configuration.Entities.ProjectEntities
{
    internal class ProjectRoleConfiguration : IEntityTypeConfiguration<ProjectRole>
    {
        public void Configure(EntityTypeBuilder<ProjectRole> builder)
        {
            builder.HasKey(pr => new { pr.ProjectId, pr.EmployeeId, pr.ProjectRoleTypeId });

            builder
                .HasOne(pr => pr.Project)
                .WithMany(pr => pr.ProjectRoles)
                .HasForeignKey(pr => pr.ProjectId);

            builder
                .HasOne(pr => pr.Employee)
                .WithMany(pr => pr.ProjectRoles)
                .HasForeignKey(pr => pr.EmployeeId);

            builder
                .HasOne(pr => pr.ProjectRoleType)
                .WithMany(pr => pr.ProjectRoles)
                .HasForeignKey(pr => pr.ProjectRoleTypeId);
        }
    }
}
