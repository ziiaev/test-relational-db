namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class EmployeeRole
    {
        public Guid EmployeeId { get; set; }

        public virtual Employee Employee { get; set; }

        public Guid RoleId { get; set; }

        public virtual Role Role { get; set; }
    }
}
