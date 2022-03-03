using EfTestDataStorage.Entities.IdentityEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.IdentityEntities
{
    internal class UnitConfiguration : IEntityTypeConfiguration<Unit>
    {
        public void Configure(EntityTypeBuilder<Unit> builder)
        {
            builder.HasKey(x => x.Id);

            builder.HasOne(u => u.UnitHead)
                .WithMany(e => e.SubordinateUnits)
                .HasForeignKey(u => u.UnitHeadId);

            builder.HasOne(u => u.ParentUnit)
                .WithMany(u => u.SubUnits)
                .HasForeignKey(u => u.ParentUnitId).IsRequired(false);
        }
    }
}
