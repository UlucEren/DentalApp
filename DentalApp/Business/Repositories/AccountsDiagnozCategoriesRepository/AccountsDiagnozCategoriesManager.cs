using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AccountsDiagnozCategoriesRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AccountsDiagnozCategoriesRepository.Validation;
using Business.Repositories.AccountsDiagnozCategoriesRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AccountsDiagnozCategoriesRepository;

namespace Business.Repositories.AccountsDiagnozCategoriesRepository
{
    public class AccountsDiagnozCategoriesManager : IAccountsDiagnozCategoriesService
    {
        private readonly IAccountsDiagnozCategoriesDal _accountsDiagnozCategoriesDal;

        public AccountsDiagnozCategoriesManager(IAccountsDiagnozCategoriesDal accountsDiagnozCategoriesDal)
        {
            _accountsDiagnozCategoriesDal = accountsDiagnozCategoriesDal;
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountsDiagnozCategoriesValidator))]
        //[RemoveCacheAspect("IAccountsDiagnozCategoriesService.Get")]

        public async Task<IResult> Add(AccountsDiagnozCategories accountsDiagnozCategories)
        {
            await _accountsDiagnozCategoriesDal.Add(accountsDiagnozCategories);
            return new SuccessResult(AccountsDiagnozCategoriesMessages.Added);
        }

        //[SecuredAspect()]
        //[ValidationAspect(typeof(AccountsDiagnozCategoriesValidator))]
        //[RemoveCacheAspect("IAccountsDiagnozCategoriesService.Get")]

        public async Task<IResult> Update(AccountsDiagnozCategories accountsDiagnozCategories)
        {
            await _accountsDiagnozCategoriesDal.Update(accountsDiagnozCategories);
            return new SuccessResult(AccountsDiagnozCategoriesMessages.Updated);
        }

        //[SecuredAspect()]
        //[RemoveCacheAspect("IAccountsDiagnozCategoriesService.Get")]

        public async Task<IResult> Delete(AccountsDiagnozCategories accountsDiagnozCategories)
        {
            await _accountsDiagnozCategoriesDal.Delete(accountsDiagnozCategories);
            return new SuccessResult(AccountsDiagnozCategoriesMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<AccountsDiagnozCategories>>> GetList()
        {
            return new SuccessDataResult<List<AccountsDiagnozCategories>>(await _accountsDiagnozCategoriesDal.GetAll());
        }

        //[SecuredAspect()]
        public async Task<IDataResult<AccountsDiagnozCategories>> GetById(long id)
        {
            return new SuccessDataResult<AccountsDiagnozCategories>(await _accountsDiagnozCategoriesDal.Get(p => p.Id == id));
        }

        public async Task<IDataResult<List<AccountsDiagnozCategories>>> GetByAccountsIdList(string AspNetUsersIdFk)
        {
            return new SuccessDataResult<List<AccountsDiagnozCategories>>(await _accountsDiagnozCategoriesDal.GetAll(x=>x.Accounts_AspNetUsersIdFk_Fk == AspNetUsersIdFk));
        }
        public string GetCategoryName(long id)
        {
            var temp = _accountsDiagnozCategoriesDal.GetSync(p => p.Id == id);
            string categoryName = temp.CategoryName;
            return categoryName;
        }
    }
}
