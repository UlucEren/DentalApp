using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.TDBCostNamesRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.TDBCostNamesRepository
{
    public class EfTDBCostNamesDal : EfEntityRepositoryBase<TDBCostNames, SimpleContextDb>, ITDBCostNamesDal
    {
    }
}
