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
        Task<IResult> Add(AccountsTreatments accountTreatments);
        Task<IResult> Update(AccountsTreatments accountTreatments);
        Task<IResult> Delete(AccountsTreatments accountTreatments);
        Task<IDataResult<List<AccountsTreatments>>> GetList();
        Task<IDataResult<AccountsTreatments>> GetById(string Id);
        Task<IDataResult<List<AccountsTreatments>>> GetTreatmentListByActionId(string accountsId, int actionsListsId, string patientId);
    }
}
