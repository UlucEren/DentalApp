using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess;
using Entities.Concrete;

namespace DataAccess.Repositories.TDBCostNameCategoriesRepository
{
    public interface ITDBCostNameCategoriesDal : IEntityRepository<TDBCostNameCategories>
    {
    }
}
