using EfTestDataStorage.Entities.IdentityEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.IdentityEntities
{
    internal class EmployeeUnitConfiguration : IEntityTypeConfiguration<EmployeeUnit>
    {
        public void Configure(EntityTypeBuilder<EmployeeUnit> builder)
        {
            builder.HasKey(eu => new { eu.EmployeeId, eu.UnitId });

            builder
                .HasOne(eu => eu.Employee)
                .WithMany(e => e.Units)
                .HasForeignKey(eu => eu.EmployeeId);

            builder
                .HasOne(eu => eu.Unit)
                .WithMany(u => u.EmployeeUnits)
                .HasForeignKey(eu => eu.UnitId);
        }
    }
}
