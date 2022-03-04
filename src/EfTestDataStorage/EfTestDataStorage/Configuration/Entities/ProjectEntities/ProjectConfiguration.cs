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

            builder.HasOne(p => p.Customer)
                .WithMany(c => c.Projects)
                .HasForeignKey(p => p.CustomerId);

            builder.Property(p => p.ProjectHealth).HasConversion<string>();
            builder.Property(p => p.ProjectStatus).HasConversion<string>();
        }
    }
}
