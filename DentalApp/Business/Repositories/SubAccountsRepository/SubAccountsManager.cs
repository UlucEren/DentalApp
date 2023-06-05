using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.SubAccountsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.SubAccountsRepository.Validation;
using Business.Repositories.SubAccountsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.SubAccountsRepository;

namespace Business.Repositories.SubAccountsRepository
{
    public class SubAccountsManager : ISubAccountsService
    {
        private readonly ISubAccountsDal _subAccountsDal;

        public SubAccountsManager(ISubAccountsDal subAccountsDal)
        {
            _subAccountsDal = subAccountsDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(SubAccountsValidator))]
        [RemoveCacheAspect("ISubAccountsService.Get")]

        public async Task<IResult> Add(SubAccounts subAccounts)
        {
            await _subAccountsDal.Add(subAccounts);
            return new SuccessResult(SubAccountsMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(SubAccountsValidator))]
        [RemoveCacheAspect("ISubAccountsService.Get")]

        public async Task<IResult> Update(SubAccounts subAccounts)
        {
            await _subAccountsDal.Update(subAccounts);
            return new SuccessResult(SubAccountsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("ISubAccountsService.Get")]

        public async Task<IResult> Delete(SubAccounts subAccounts)
        {
            await _subAccountsDal.Delete(subAccounts);
            return new SuccessResult(SubAccountsMessages.Deleted);
        }

        //[SecuredAspect()]
        //[CacheAspect()]
        //[PerformanceAspect()]
        public async Task<IDataResult<List<SubAccounts>>> GetList()
        {
            return new SuccessDataResult<List<SubAccounts>>(await _subAccountsDal.GetAll());
        }

        //[SecuredAspect()]
        public async Task<IDataResult<SubAccounts>> GetById(int id)
        {
            return new SuccessDataResult<SubAccounts>(await _subAccountsDal.Get(p => p.Id == id));
        }

		public async Task<IDataResult<SubAccounts>> GetByAspNetUsers_Id_Fk(string id)
		{
			return new SuccessDataResult<SubAccounts>(await _subAccountsDal.Get(p => p.AspNetUsers_Id_Fk == id));
		}
	}
}
