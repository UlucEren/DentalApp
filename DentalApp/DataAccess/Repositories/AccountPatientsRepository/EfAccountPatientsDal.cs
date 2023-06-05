using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountPatientsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountPatientsRepository
{
    public class EfAccountPatientsDal : EfEntityRepositoryBase<AccountPatients, SimpleContextDb>, IAccountPatientsDal
    {
    }
}
