using EfTestDataStorage.Entities.ProjectEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.ProjectEntities
{
    internal class ProjectSetConfiguration : IEntityTypeConfiguration<ProjectSet>
    {
        public void Configure(EntityTypeBuilder<ProjectSet> builder)
        {
            builder.HasKey(d => d.Id);

            builder.HasOne(d => d.Customer)
                .WithMany(e => e.ProjectSets)
                .HasForeignKey(d => d.CustomerId);
        }
    }
}
