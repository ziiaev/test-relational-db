namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class ProjectSet : BaseEntity
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public Guid CustomerId { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual ICollection<Project> Projects { get; set; }
    }
}
