using EfTestDataStorage.Entities.IdentityEntities;

namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class ProjectEmployee : BaseEntity
    {
        public Guid ProjectId { get; set; }

        public virtual Project Project { get; set; }

        public Guid EmployeeId { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
