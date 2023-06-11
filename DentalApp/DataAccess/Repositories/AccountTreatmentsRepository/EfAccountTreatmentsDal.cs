using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AccountTreatmentsRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AccountTreatmentsRepository
{
    public class EfAccountTreatmentsDal : EfEntityRepositoryBase<AccountTreatments, SimpleContextDb>, IAccountTreatmentsDal
    {
    }
}
