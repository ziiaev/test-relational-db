using EfTestDataStorage.Entities.ProjectEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.ProjectEntities
{
    internal class ProjectConfiguration : IEntityTypeConfiguration<Project>
    {
        public void Configure(EntityTypeBuilder<Project> builder)
        {
            builder.HasKey(d => d.Id);

            builder.HasOne(d => d.ProjectSet)
                .WithMany(e => e.Projects)
                .HasForeignKey(d => d.ProjectSetId);
        }
    }
}
