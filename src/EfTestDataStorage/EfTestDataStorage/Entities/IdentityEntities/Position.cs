namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class Position : BaseEntity
    {
        public string Name { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
