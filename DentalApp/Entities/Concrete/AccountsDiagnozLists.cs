using System.ComponentModel.DataAnnotations;

namespace Entities.Concrete
{
    public class AccountsDiagnozLists
    {
        [Key]
        public string Id { get; set; }
        public string Name { get; set; }        
        public int Queue { get; set; }
        public long AccountsDiagnozCategories_Id_Fk { get; set; }

    }
}
