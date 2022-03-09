namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class Customer
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string PhoneNumber { get; set; }

        public virtual ICollection<Project> Projects { get; set; }
    }
}
