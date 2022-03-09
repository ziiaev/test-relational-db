namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class Position
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
