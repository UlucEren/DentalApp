using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountPatientsRepository
{
    public interface IAccountPatientsService
    {
        Task<IResult> Add(AccountPatients accountPatients);
        Task<IResult> Update(AccountPatients accountPatients);
        Task<IResult> Delete(AccountPatients accountPatients);
        Task<IDataResult<List<AccountPatients>>> GetList();
        Task<IDataResult<AccountPatients>> GetByPatient(string patientId,string accountId);
        Task<IDataResult<List<AccountPatients>>> GetSearchList(string patientName,string accountId);
    }
}
