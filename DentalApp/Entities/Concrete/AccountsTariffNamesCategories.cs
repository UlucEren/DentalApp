namespace Entities.Concrete
{
    public class AccountsTariffNamesCategories
    {
        public long Id { get; set; }
        public string CategoryName { get; set; }
        public long AccountsTariffNames_Id_Fk { get; set; }
    }
}
