using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountsTariffNamesCategoriesRepository.Validation;
using Business.Repositories.AccountsTariffNamesCategoriesRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountsTariffNamesCategoriesRepository;

namespace Business.Repositories.AccountsTariffNamesCategoriesRepository
{
    public class AccountsTariffNamesCategoriesManager : IAccountsTariffNamesCategoriesService
    {
        private readonly IAccountsTariffNamesCategoriesDal _accountsTariffNamesCategoriesDal;

        public AccountsTariffNamesCategoriesManager(IAccountsTariffNamesCategoriesDal accountsTariffNamesCategoriesDal)
        {
            _accountsTariffNamesCategoriesDal = accountsTariffNamesCategoriesDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AccountsTariffNamesCategoriesValidator))]
        [RemoveCacheAspect("IAccountsTariffNamesCategoriesService.Get")]

        public async Task<IResult> Add(AccountsTariffNamesCategories accountsTariffNamesCategories)
        {
            await _accountsTariffNamesCategoriesDal.Add(accountsTariffNamesCategories);
            return new SuccessResult(AccountsTariffNamesCategoriesMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AccountsTariffNamesCategoriesValidator))]
        [RemoveCacheAspect("IAccountsTariffNamesCategoriesService.Get")]

        public async Task<IResult> Update(AccountsTariffNamesCategories accountsTariffNamesCategories)
        {
            await _accountsTariffNamesCategoriesDal.Update(accountsTariffNamesCategories);
            return new SuccessResult(AccountsTariffNamesCategoriesMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IAccountsTariffNamesCategoriesService.Get")]

        public async Task<IResult> Delete(AccountsTariffNamesCategories accountsTariffNamesCategories)
        {
            await _accountsTariffNamesCategoriesDal.Delete(accountsTariffNamesCategories);
            return new SuccessResult(AccountsTariffNamesCategoriesMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<AccountsTariffNamesCategories>>> GetList()
        {
            return new SuccessDataResult<List<AccountsTariffNamesCategories>>(await _accountsTariffNamesCategoriesDal.GetAll());
        }

        public async Task<AccountsTariffNamesCategories> GetById(long id)
        {
            return await _accountsTariffNamesCategoriesDal.Get(p => p.Id == id);
        }

        public async Task<List<AccountsTariffNamesCategories>> GetByAccountsTariffNames_Id_Fk(long id)
        {
            return new List<AccountsTariffNamesCategories>(await _accountsTariffNamesCategoriesDal.GetAll(p => p.AccountsTariffNames_Id_Fk == id));
        }

        public string GetCategoryName(long id)
        {
            var temp = _accountsTariffNamesCategoriesDal.GetSync(p => p.Id == id);
            string categoryName=temp.CategoryName;
            return categoryName;
        }
    }
}
