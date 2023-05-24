using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountsTariffNamesRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountsTariffNamesRepository.Validation;
using Business.Repositories.AccountsTariffNamesRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountsTariffNamesRepository;

namespace Business.Repositories.AccountsTariffNamesRepository
{
    public class AccountsTariffNamesManager : IAccountsTariffNamesService
    {
        private readonly IAccountsTariffNamesDal _accountsTariffNamesDal;

        public AccountsTariffNamesManager(IAccountsTariffNamesDal accountsTariffNamesDal)
        {
            _accountsTariffNamesDal = accountsTariffNamesDal;
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountsTariffNamesValidator))]
        //[RemoveCacheAspect("IAccountsTariffNamesService.Get")]

        public async Task<IResult> Add(AccountsTariffNames accountsTariffNames)
        {
            await _accountsTariffNamesDal.Add(accountsTariffNames);
            return new SuccessResult(AccountsTariffNamesMessages.Added);
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountsTariffNamesValidator))]
        //[RemoveCacheAspect("IAccountsTariffNamesService.Get")]

        public async Task<IResult> Update(AccountsTariffNames accountsTariffNames)
        {
            await _accountsTariffNamesDal.Update(accountsTariffNames);
            return new SuccessResult(AccountsTariffNamesMessages.Updated);
        }

        //[SecuredAspect()]
        //[RemoveCacheAspect("IAccountsTariffNamesService.Get")]

        public async Task<IResult> Delete(AccountsTariffNames accountsTariffNames)
        {
            await _accountsTariffNamesDal.Delete(accountsTariffNames);
            return new SuccessResult(AccountsTariffNamesMessages.Deleted);
        }

        //[SecuredAspect()]
        //[CacheAspect()]
        //[PerformanceAspect()]
        public async Task<IDataResult<List<AccountsTariffNames>>> GetList()
        {
            return new SuccessDataResult<List<AccountsTariffNames>>(await _accountsTariffNamesDal.GetAll());
        }

        //[SecuredAspect()]
        public async Task<IDataResult<AccountsTariffNames>> GetById(long id)
        {
            return new SuccessDataResult<AccountsTariffNames>(await _accountsTariffNamesDal.Get(p => p.Id == id));
        }

        public async Task<IDataResult<AccountsTariffNames>> GetByAccountsId(string accountsId)
        {
            return new SuccessDataResult<AccountsTariffNames>(await _accountsTariffNamesDal.Get(p => p.Accounts_AspNetUsersIdFk_Fk == accountsId));
        }

		public async Task<List<AccountsTariffNames>> GetByAccountsIdList(string accountsId)
		{
			return new List<AccountsTariffNames>(await _accountsTariffNamesDal.GetAll(p => p.Accounts_AspNetUsersIdFk_Fk == accountsId));
		}
	}
}
