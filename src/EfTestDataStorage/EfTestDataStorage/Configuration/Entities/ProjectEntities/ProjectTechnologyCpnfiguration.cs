using EfTestDataStorage.Entities.ProjectEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.ProjectEntities
{
    internal class ProjectTechnologyCpnfiguration : IEntityTypeConfiguration<ProjectTechnology>
    {
        public void Configure(EntityTypeBuilder<ProjectTechnology> builder)
        {
            builder.HasKey(pr => new { pr.ProjectId, pr.TechnologyId });

            builder
                .HasOne(pt => pt.Project)
                .WithMany(pt => pt.ProjectTechnologies)
                .HasForeignKey(pt => pt.ProjectId);

            builder
                .HasOne(pt => pt.Technology)
                .WithMany(pt => pt.ProjectTechnologies)
                .HasForeignKey(pt => pt.TechnologyId);
        }
    }
}
