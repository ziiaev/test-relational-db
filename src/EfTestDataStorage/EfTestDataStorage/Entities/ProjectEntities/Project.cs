namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class Project : BaseEntity
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public DateOnly StartDate { get; set; }

        public DateOnly? EndDate { get; set; }

        public string Tools { get; set; }

        public string Technologies { get; set; }

        public Guid ProjectSetId { get; set; }

        public virtual ProjectSet ProjectSet { get; set; }

        public virtual ICollection<ProjectEmployee> ProjectEmployees { get; set; }

        public virtual ICollection<ProjectRole> ProjectRoles { get; set; }
    }
}
