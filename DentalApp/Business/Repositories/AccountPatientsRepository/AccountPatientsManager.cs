using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountPatientsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountPatientsRepository.Validation;
using Business.Repositories.AccountPatientsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountPatientsRepository;
using System.ComponentModel;

namespace Business.Repositories.AccountPatientsRepository
{
    public class AccountPatientsManager : IAccountPatientsService
    {
        private readonly IAccountPatientsDal _accountPatientsDal;

        public AccountPatientsManager(IAccountPatientsDal accountPatientsDal)
        {
            _accountPatientsDal = accountPatientsDal;
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountPatientsValidator))]
        //[RemoveCacheAspect("IAccountPatientsService.Get")]

        public async Task<IResult> Add(AccountPatients accountPatients)
        {
            await _accountPatientsDal.Add(accountPatients);
            return new SuccessResult(AccountPatientsMessages.Added);
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountPatientsValidator))]
        //[RemoveCacheAspect("IAccountPatientsService.Get")]

        public async Task<IResult> Update(AccountPatients accountPatients)
        {
            await _accountPatientsDal.Update(accountPatients);
            return new SuccessResult(AccountPatientsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IAccountPatientsService.Get")]

        public async Task<IResult> Delete(AccountPatients accountPatients)
        {
            await _accountPatientsDal.Delete(accountPatients);
            return new SuccessResult(AccountPatientsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<AccountPatients>>> GetList()
        {
            return new SuccessDataResult<List<AccountPatients>>(await _accountPatientsDal.GetAll());
        }
		public async Task<IDataResult<AccountPatients>> GetByPatient(string patientId,string accountId)
		{
			return new SuccessDataResult<AccountPatients>(await _accountPatientsDal.Get(p => p.Id == patientId && p.Accounts_AspNetUsersIdFk_Fk == accountId));
		}

        public async Task<IDataResult<List<AccountPatients>>> GetSearchList(string patientName, string accountId)
        {
            return new SuccessDataResult<List<AccountPatients>>(await _accountPatientsDal.GetAll(x=>x.NameSurname.Contains(patientName) && x.Accounts_AspNetUsersIdFk_Fk== accountId));
        }
    }
}
