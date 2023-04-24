using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.TDBCostListsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.TDBCostListsRepository
{
    public class EfTDBCostListsDal : EfEntityRepositoryBase<TDBCostLists, SimpleContextDb>, ITDBCostListsDal
    {
    }
}
