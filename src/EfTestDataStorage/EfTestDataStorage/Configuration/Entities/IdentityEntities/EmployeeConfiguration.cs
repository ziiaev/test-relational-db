using EfTestDataStorage.Entities.IdentityEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.IdentityEntities
{
    internal class EmployeeConfiguration : IEntityTypeConfiguration<Employee>
    {
        public void Configure(EntityTypeBuilder<Employee> builder)
        {
            builder.HasKey(e => e.Id);

            builder.HasOne(e => e.PersonalInfo)
                .WithOne(b => b.Employee)
                .HasForeignKey<EmployeePersonalInfo>(b => b.EmployeeId);

            builder.HasOne(e => e.Position)
                .WithMany(b => b.Employees)
                .HasForeignKey(b => b.PositionId);
        }
    }
}
