namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class Technology
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<ProjectTechnology> ProjectTechnologies { get; set; }
    }
}
