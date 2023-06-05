using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountsRepository
{
    public class EfAccountsDal : EfEntityRepositoryBase<Accounts, SimpleContextDb>, IAccountsDal
    {
    }
}
