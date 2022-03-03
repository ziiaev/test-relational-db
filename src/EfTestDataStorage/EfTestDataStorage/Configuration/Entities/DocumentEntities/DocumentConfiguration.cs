using EfTestDataStorage.Entities.DocumentEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfTestDataStorage.Configuration.Entities.DocumentEntities
{
    internal class DocumentConfiguration : IEntityTypeConfiguration<EmployeeDocument>
    {
        public void Configure(EntityTypeBuilder<EmployeeDocument> builder)
        {
            builder.HasKey(d => d.Id);

            builder.HasOne(d => d.Employee)
                .WithMany(e => e.Documents)
                .HasForeignKey(d => d.EmployeeId);

            builder.HasOne(d => d.DocumentType)
                .WithMany(e => e.EmployeeDocuments)
                .HasForeignKey(d => d.DocumentTypeId);
        }
    }
}
