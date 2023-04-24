using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.TDBCostNameCategoriesRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.TDBCostNameCategoriesRepository.Validation;
using Business.Repositories.TDBCostNameCategoriesRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.TDBCostNameCategoriesRepository;

namespace Business.Repositories.TDBCostNameCategoriesRepository
{
    public class TDBCostNameCategoriesManager : ITDBCostNameCategoriesService
    {
        private readonly ITDBCostNameCategoriesDal _tDBCostNameCategoriesDal;

        public TDBCostNameCategoriesManager(ITDBCostNameCategoriesDal tDBCostNameCategoriesDal)
        {
            _tDBCostNameCategoriesDal = tDBCostNameCategoriesDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(TDBCostNameCategoriesValidator))]
        [RemoveCacheAspect("ITDBCostNameCategoriesService.Get")]

        public async Task<IResult> Add(TDBCostNameCategories tDBCostNameCategories)
        {
            await _tDBCostNameCategoriesDal.Add(tDBCostNameCategories);
            return new SuccessResult(TDBCostNameCategoriesMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(TDBCostNameCategoriesValidator))]
        [RemoveCacheAspect("ITDBCostNameCategoriesService.Get")]

        public async Task<IResult> Update(TDBCostNameCategories tDBCostNameCategories)
        {
            await _tDBCostNameCategoriesDal.Update(tDBCostNameCategories);
            return new SuccessResult(TDBCostNameCategoriesMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("ITDBCostNameCategoriesService.Get")]

        public async Task<IResult> Delete(TDBCostNameCategories tDBCostNameCategories)
        {
            await _tDBCostNameCategoriesDal.Delete(tDBCostNameCategories);
            return new SuccessResult(TDBCostNameCategoriesMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<TDBCostNameCategories>>> GetList()
        {
            return new SuccessDataResult<List<TDBCostNameCategories>>(await _tDBCostNameCategoriesDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<TDBCostNameCategories>> GetById(int id)
        {
            return new SuccessDataResult<TDBCostNameCategories>(await _tDBCostNameCategoriesDal.Get(p => p.Id == id));
        }

        public async Task<List<TDBCostNameCategories>> GetByTDBCostNames_Id_Fk(long id)
        {
            return new List<TDBCostNameCategories>(await _tDBCostNameCategoriesDal.GetAll(p => p.TDBCostNames_Id_Fk == id));
        }
    }
}
