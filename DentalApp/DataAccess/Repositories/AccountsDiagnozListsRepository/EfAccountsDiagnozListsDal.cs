using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountsDiagnozListsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountsDiagnozListsRepository
{
    public class EfAccountsDiagnozListsDal : EfEntityRepositoryBase<AccountsDiagnozLists, SimpleContextDb>, IAccountsDiagnozListsDal
    {
    }
}
