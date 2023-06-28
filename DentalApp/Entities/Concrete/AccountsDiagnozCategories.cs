namespace Entities.Concrete
{
    public class AccountsDiagnozCategories
    {
        public long Id { get; set; }
        public string CategoryName { get; set; }
        public DateTime CreateDate { get; set; }
        public string Accounts_AspNetUsersIdFk_Fk { get; set; }
    }
}
