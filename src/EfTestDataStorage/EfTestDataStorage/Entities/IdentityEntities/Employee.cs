using EfTestDataStorage.Entities.DocumentEntities;
using EfTestDataStorage.Entities.ProjectEntities;

namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class Employee
    {
        public Guid Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Summary { get; set; }

        public Guid PositionId { get; set; }

        public virtual Position Position { get; set; }

        public virtual EmployeePersonalInfo PersonalInfo { get; set; }

        public virtual ICollection<EmployeeDocument> Documents { get; set; }

        public virtual ICollection<EmployeeUnit> Units { get; set; }

        public virtual ICollection<EmployeeRole> Roles { get; set; }

        public virtual ICollection<ProjectRole> ProjectRoles { get; set; }

        public virtual ICollection<Unit> SubordinateUnits { get; set; }
    }
}
