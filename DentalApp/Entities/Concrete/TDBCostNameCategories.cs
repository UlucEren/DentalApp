using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class TDBCostNameCategories
    {
        public int Id { get; set; }
        public string TDBCategoryName { get; set; }
        public int TDBCostNames_Id_Fk { get; set; }
    }
}
