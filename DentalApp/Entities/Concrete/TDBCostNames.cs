using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class TDBCostNames
    {
        public int Id { get; set; }
        public string TDBCostName { get; set; }
        public string Comment { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
