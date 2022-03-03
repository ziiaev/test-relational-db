using EfTestDataStorage.Entities.Enums;

namespace EfTestDataStorage.Entities.IdentityEntities
{
    public class EmployeePersonalInfo : BaseEntity
    {
        public Guid EmployeeId { get; set; }

        public virtual Employee Employee { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string PhoneNumber { get; set; }

        public DateOnly BirthDate { get; set; }

        public Sex Sex { get; set; }
    }
}
