using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountsTariffListsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountsTariffListsRepository.Validation;
using Business.Repositories.AccountsTariffListsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountsTariffListsRepository;

namespace Business.Repositories.AccountsTariffListsRepository
{
    public class AccountsTariffListsManager : IAccountsTariffListsService
    {
        private readonly IAccountsTariffListsDal _accountsTariffListsDal;

        public AccountsTariffListsManager(IAccountsTariffListsDal accountsTariffListsDal)
        {
            _accountsTariffListsDal = accountsTariffListsDal;
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountsTariffListsValidator))]
        //[RemoveCacheAspect("IAccountsTariffListsService.Get")]

        public async Task<IResult> Add(AccountsTariffLists accountsTariffLists)
        {
            await _accountsTariffListsDal.Add(accountsTariffLists);
            return new SuccessResult(AccountsTariffListsMessages.Added);
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountsTariffListsValidator))]
        //[RemoveCacheAspect("IAccountsTariffListsService.Get")]

        public async Task<IResult> Update(AccountsTariffLists accountsTariffLists)
        {
            await _accountsTariffListsDal.Update(accountsTariffLists);
            return new SuccessResult(AccountsTariffListsMessages.Updated);
        }

        //[SecuredAspect()]
        //[RemoveCacheAspect("IAccountsTariffListsService.Get")]

        public async Task<IResult> Delete(AccountsTariffLists accountsTariffLists)
        {
            await _accountsTariffListsDal.Delete(accountsTariffLists);
            return new SuccessResult(AccountsTariffListsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<AccountsTariffLists>>> GetList()
        {
            return new SuccessDataResult<List<AccountsTariffLists>>(await _accountsTariffListsDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<AccountsTariffLists>> GetById(int id)
        {
            return new SuccessDataResult<AccountsTariffLists>(await _accountsTariffListsDal.Get(p => p.Id == id));
        }

        public async Task<List<AccountsTariffLists>> GetListByCategories_Id(long id)
        {
            return new List<AccountsTariffLists> (await _accountsTariffListsDal.GetAll(x=>x.AccountsTariffNamesCategories_Id_Fk==id));
        }
    }
}
