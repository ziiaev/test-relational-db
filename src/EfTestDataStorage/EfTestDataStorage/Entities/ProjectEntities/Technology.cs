namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class Technology : BaseEntity
    {
        public string Name { get; set; }

        public virtual ICollection<ProjectTechnology> ProjectTechnologies { get; set; }
    }
}
