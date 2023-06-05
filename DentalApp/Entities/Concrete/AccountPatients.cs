using System.Reflection.Emit;

namespace Entities.Concrete
{
    public class AccountPatients
    {
        public string Id { get; set; }
        public string NameSurname { get; set; }
        public string IdentityNumber { get; set; }
        public string Email { get; set; }
        public string Nationality { get; set; }
		public string Gender { get; set; }
		public DateTime Birthday { get; set; }
        public string Blood { get; set; }
        public string MobilePhone { get; set; }
        public string LandPhone { get; set; }
        public string City { get; set; }
        public string District { get; set; }
        public string Address { get; set; }
        public long Tariff { get; set; }
        public string TreatmentStatus { get; set; }
        public string Accounts_AspNetUsersIdFk_Fk { get; set; }
        public DateTime LastAccessTime { get; set; }
    }
}
