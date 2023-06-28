using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountsDiagnozListsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountsDiagnozListsRepository.Validation;
using Business.Repositories.AccountsDiagnozListsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountsDiagnozListsRepository;

namespace Business.Repositories.AccountsDiagnozListsRepository
{
    public class AccountsDiagnozListsManager : IAccountsDiagnozListsService
    {
        private readonly IAccountsDiagnozListsDal _accountsDiagnozListsDal;

        public AccountsDiagnozListsManager(IAccountsDiagnozListsDal accountsDiagnozListsDal)
        {
            _accountsDiagnozListsDal = accountsDiagnozListsDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AccountsDiagnozListsValidator))]
        [RemoveCacheAspect("IAccountsDiagnozListsService.Get")]

        public async Task<IResult> Add(AccountsDiagnozLists accountsDiagnozLists)
        {
            await _accountsDiagnozListsDal.Add(accountsDiagnozLists);
            return new SuccessResult(AccountsDiagnozListsMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AccountsDiagnozListsValidator))]
        [RemoveCacheAspect("IAccountsDiagnozListsService.Get")]

        public async Task<IResult> Update(AccountsDiagnozLists accountsDiagnozLists)
        {
            await _accountsDiagnozListsDal.Update(accountsDiagnozLists);
            return new SuccessResult(AccountsDiagnozListsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IAccountsDiagnozListsService.Get")]

        public async Task<IResult> Delete(AccountsDiagnozLists accountsDiagnozLists)
        {
            await _accountsDiagnozListsDal.Delete(accountsDiagnozLists);
            return new SuccessResult(AccountsDiagnozListsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<AccountsDiagnozLists>>> GetList()
        {
            return new SuccessDataResult<List<AccountsDiagnozLists>>(await _accountsDiagnozListsDal.GetAll());
        }
        public async Task<List<AccountsDiagnozLists>> GetListByCategories_Id(long id)
        {
            return new List<AccountsDiagnozLists>(await _accountsDiagnozListsDal.GetAll(x => x.AccountsDiagnozCategories_Id_Fk == id));
        }

    }
}
