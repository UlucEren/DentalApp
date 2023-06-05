using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.SubAccountsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.SubAccountsRepository
{
    public class EfSubAccountsDal : EfEntityRepositoryBase<SubAccounts, SimpleContextDb>, ISubAccountsDal
    {
    }
}
