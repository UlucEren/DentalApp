using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.TDBCostNameCategoriesRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.TDBCostNameCategoriesRepository
{
    public class EfTDBCostNameCategoriesDal : EfEntityRepositoryBase<TDBCostNameCategories, SimpleContextDb>, ITDBCostNameCategoriesDal
    {
    }
}
