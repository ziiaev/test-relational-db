namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class Customer : BaseEntity
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public string Email { get; set; }

        public virtual ICollection<ProjectSet> ProjectSets { get; set; }
    }
}
