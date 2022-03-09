using EfTestDataStorage.Entities.Enums;

namespace EfTestDataStorage.Entities.ProjectEntities
{
    public class Project
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public DateOnly StartDate { get; set; }

        public DateOnly? EndDate { get; set; }

        public ProjectHealth ProjectHealth { get; set; }

        public ProjectStatus ProjectStatus { get; set; }

        public Guid CustomerId { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual ICollection<ProjectRole> ProjectRoles { get; set; }

        public virtual ICollection<ProjectTechnology> ProjectTechnologies { get; set; }
    }
}
