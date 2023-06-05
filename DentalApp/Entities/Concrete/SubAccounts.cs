namespace Entities.Concrete
{
    public class SubAccounts
    {
        public long Id { get; set; }
        public string AspNetUsers_Id_Fk { get; set; }
        public string Accounts_AspNetUsersIdFk_Fk { get; set; }
       
    }
}
