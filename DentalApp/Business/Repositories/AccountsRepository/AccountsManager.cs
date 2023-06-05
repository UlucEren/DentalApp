using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountsRepository.Validation;
using Business.Repositories.AccountsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountsRepository;

namespace Business.Repositories.AccountsRepository
{
    public class AccountsManager : IAccountsService
    {
        private readonly IAccountsDal _accountsDal;

        public AccountsManager(IAccountsDal accountsDal)
        {
            _accountsDal = accountsDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AccountsValidator))]
        [RemoveCacheAspect("IAccountsService.Get")]

        public async Task<IResult> Add(Accounts accounts)
        {
            await _accountsDal.Add(accounts);
            return new SuccessResult(AccountsMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AccountsValidator))]
        [RemoveCacheAspect("IAccountsService.Get")]

        public async Task<IResult> Update(Accounts accounts)
        {
            await _accountsDal.Update(accounts);
            return new SuccessResult(AccountsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IAccountsService.Get")]

        public async Task<IResult> Delete(Accounts accounts)
        {
            await _accountsDal.Delete(accounts);
            return new SuccessResult(AccountsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<Accounts>>> GetList()
        {
            return new SuccessDataResult<List<Accounts>>(await _accountsDal.GetAll());
        }
		public async Task<IDataResult<Accounts>> GetByAspNetUsers_Id_Fk(string id)
		{
			return new SuccessDataResult<Accounts>(await _accountsDal.Get(p => p.AspNetUsers_Id_Fk == id));
		}
	}
}
