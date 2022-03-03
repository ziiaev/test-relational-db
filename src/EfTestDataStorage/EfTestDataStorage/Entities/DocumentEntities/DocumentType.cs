namespace EfTestDataStorage.Entities.DocumentEntities
{
    public class DocumentType : BaseEntity
    {
        public string Name { get; set; }

        public string? Description { get; set; }

        public virtual ICollection<EmployeeDocument> EmployeeDocuments { get; set; }
    }
}
