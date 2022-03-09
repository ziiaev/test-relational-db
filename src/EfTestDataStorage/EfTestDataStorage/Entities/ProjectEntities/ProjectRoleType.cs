namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class ProjectRoleType
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public virtual ICollection<ProjectRole> ProjectRoles { get; set; }
    }
}
