namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class Role : BaseEntity
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public virtual ICollection<EmployeeRole> EmployeeRoles { get; set; }
    }
}
