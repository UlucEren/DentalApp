using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountTreatmentsRepository
{
    public interface IAccountTreatmentsService
    {
        Task<IResult> Add(AccountTreatments accountTreatments);
        Task<IResult> Update(AccountTreatments accountTreatments);
        Task<IResult> Delete(AccountTreatments accountTreatments);
        Task<IDataResult<List<AccountTreatments>>> GetList();        
        Task<IDataResult<List<AccountTreatments>>> GetTreatmentListByActionId(string accountsId, int actionsListsId, string patientId);
    }
}
