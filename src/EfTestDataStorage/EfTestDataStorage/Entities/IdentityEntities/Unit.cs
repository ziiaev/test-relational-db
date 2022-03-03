namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class Unit : BaseEntity
    {
        public string Name { get; set; }

        public string Description { get; set; }

        public Guid? ParentUnitId { get; set; }

        public virtual Unit? ParentUnit { get; set; }

        public Guid UnitHeadId { get; set; }

        public virtual Employee UnitHead { get; set; }

        public virtual ICollection<Unit> SubUnits { get; set; }

        public virtual ICollection<EmployeeUnit> EmployeeUnits { get; set; }
    }
}
