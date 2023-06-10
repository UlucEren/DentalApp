using System.ComponentModel.DataAnnotations;

namespace Entities.Concrete
{
    public class AccountsTariffLists
    {
        [Key]
        public string Id { get; set; }
        public string Treatment { get; set; }
        public decimal Price { get; set; }
        public int Vat { get; set; }
        public decimal PriceWithVat { get; set; }
        public decimal Cost { get; set; }
        public int Queue { get; set; }
        public long AccountsTariffNamesCategories_Id_Fk { get; set; }

    }
}
