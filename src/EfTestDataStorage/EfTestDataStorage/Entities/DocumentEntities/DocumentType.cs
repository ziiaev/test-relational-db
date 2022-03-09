namespace EfTestDataStorage.Entities.DocumentEntities
{
    public class DocumentType
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string? Description { get; set; }

        public virtual ICollection<EmployeeDocument> EmployeeDocuments { get; set; }
    }
}
