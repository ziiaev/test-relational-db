namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class ProjectRoleType : BaseEntity
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public virtual ICollection<ProjectRole> ProjectRoles { get; set; }
    }
}
