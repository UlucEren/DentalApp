using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountsTariffNamesCategoriesRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountsTariffNamesCategoriesRepository
{
    public class EfAccountsTariffNamesCategoriesDal : EfEntityRepositoryBase<AccountsTariffNamesCategories, SimpleContextDb>, IAccountsTariffNamesCategoriesDal
    {
    }
}
