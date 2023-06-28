namespace Entities.Dtos
{
    public class AccountsDiagnozListsDto
    {
        public string Id { get; set; }
        public string CategoryName { get; set; }
        public string Name { get; set; }        
        public int Queue { get; set; }
        public long AccountsDiagnozCategories_Id_Fk { get; set; }
    }
}
