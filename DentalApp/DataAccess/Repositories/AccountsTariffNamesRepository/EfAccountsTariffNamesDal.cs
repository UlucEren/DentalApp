using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountsTariffNamesRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountsTariffNamesRepository
{
    public class EfAccountsTariffNamesDal : EfEntityRepositoryBase<AccountsTariffNames, SimpleContextDb>, IAccountsTariffNamesDal
    {
    }
}
