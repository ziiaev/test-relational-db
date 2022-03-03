using EfTestDataStorage.Entities.IdentityEntities;
using System.ComponentModel.DataAnnotations.Schema;

namespace EfTestDataStorage.Entities.DocumentEntities
{
    public class EmployeeDocument : BaseEntity
    {
        public Guid DocumentTypeId { get; set; }

        public virtual DocumentType DocumentType { get; set; }

        public Guid EmployeeId { get; set; }

        public virtual Employee Employee { get; set; }

        [Column(TypeName = "jsonb")]
        public string? DocumentFields { get; set; }
    }
}
