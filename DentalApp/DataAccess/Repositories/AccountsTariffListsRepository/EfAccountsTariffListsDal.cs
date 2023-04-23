using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountsTariffListsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountsTariffListsRepository
{
    public class EfAccountsTariffListsDal : EfEntityRepositoryBase<AccountsTariffLists, SimpleContextDb>, IAccountsTariffListsDal
    {
    }
}
