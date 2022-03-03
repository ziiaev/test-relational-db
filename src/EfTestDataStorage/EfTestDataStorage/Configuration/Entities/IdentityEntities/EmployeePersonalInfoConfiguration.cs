using EfTestDataStorage.Entities.IdentityEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.IdentityEntities
{
    internal class EmployeePersonalInfoConfiguration : IEntityTypeConfiguration<EmployeePersonalInfo>
    {
        public void Configure(EntityTypeBuilder<EmployeePersonalInfo> builder)
        {
            builder.HasKey(e => e.Id);

            builder.Property(x => x.Sex).IsRequired().HasConversion<string>();
        }
    }
}
