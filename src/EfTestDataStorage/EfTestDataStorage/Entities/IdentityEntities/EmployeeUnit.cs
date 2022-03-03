namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class EmployeeUnit
    {
        public Guid EmployeeId { get; set; }

        public virtual Employee Employee { get; set; }

        public Guid UnitId { get; set; }

        public virtual Unit Unit { get; set; }
    }
}
