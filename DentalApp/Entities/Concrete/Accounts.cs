using System.ComponentModel.DataAnnotations;
using System.Reflection.Emit;

namespace Entities.Concrete
{
    public class Accounts
    {
        [Key]
        public string AspNetUsers_Id_Fk { get; set; }
        
    }
}
