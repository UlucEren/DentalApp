using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountTreatmentsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountTreatmentsRepository.Validation;
using Business.Repositories.AccountTreatmentsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountTreatmentsRepository;

namespace Business.Repositories.AccountTreatmentsRepository
{
    public class AccountTreatmentsManager : IAccountTreatmentsService
    {
        private readonly IAccountTreatmentsDal _accountTreatmentsDal;

        public AccountTreatmentsManager(IAccountTreatmentsDal accountTreatmentsDal)
        {
            _accountTreatmentsDal = accountTreatmentsDal;
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountTreatmentsValidator))]
        //[RemoveCacheAspect("IAccountTreatmentsService.Get")]

        public async Task<IResult> Add(AccountsTreatments accountTreatments)
        {
            await _accountTreatmentsDal.Add(accountTreatments);
            return new SuccessResult(AccountTreatmentsMessages.Added);
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountTreatmentsValidator))]
        //[RemoveCacheAspect("IAccountTreatmentsService.Get")]

        public async Task<IResult> Update(AccountsTreatments accountTreatments)
        {
            await _accountTreatmentsDal.Update(accountTreatments);
            return new SuccessResult(AccountTreatmentsMessages.Updated);
        }

        //[SecuredAspect()]
        //[RemoveCacheAspect("IAccountTreatmentsService.Get")]

        public async Task<IResult> Delete(AccountsTreatments accountTreatments)
        {
            await _accountTreatmentsDal.Delete(accountTreatments);
            return new SuccessResult(AccountTreatmentsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<AccountsTreatments>>> GetList()
        {
            return new SuccessDataResult<List<AccountsTreatments>>(await _accountTreatmentsDal.GetAll());
        }
         public async Task<IDataResult<AccountsTreatments>> GetById(string Id)
        {
            return new SuccessDataResult<AccountsTreatments>(await _accountTreatmentsDal.Get(x=>x.Id==Id));
        }
        public async Task<IDataResult<List<AccountsTreatments>>> GetTreatmentListByActionId(string accountsId,int actionsListsId, string patientId)
        {
            return new SuccessDataResult<List<AccountsTreatments>>(await _accountTreatmentsDal.GetAll(x=>x.Accounts_AspNetUsers_Id_Fk == accountsId && x.ActionLists_Id_Fk == actionsListsId && x.AccountPatients_Id_Fk == patientId));
        }

        

    }
}
