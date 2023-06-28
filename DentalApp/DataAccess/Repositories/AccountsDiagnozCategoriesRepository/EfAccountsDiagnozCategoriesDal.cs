using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountsDiagnozCategoriesRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountsDiagnozCategoriesRepository
{
    public class EfAccountsDiagnozCategoriesDal : EfEntityRepositoryBase<AccountsDiagnozCategories, SimpleContextDb>, IAccountsDiagnozCategoriesDal
    {
    }
}
