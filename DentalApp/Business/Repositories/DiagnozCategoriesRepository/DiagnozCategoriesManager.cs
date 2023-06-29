using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.DiagnozCategoriesRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.DiagnozCategoriesRepository.Validation;
using Business.Repositories.DiagnozCategoriesRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.DiagnozCategoriesRepository;

namespace Business.Repositories.DiagnozCategoriesRepository
{
    public class DiagnozCategoriesManager : IDiagnozCategoriesService
    {
        private readonly IDiagnozCategoriesDal _diagnozCategoriesDal;

        public DiagnozCategoriesManager(IDiagnozCategoriesDal diagnozCategoriesDal)
        {
            _diagnozCategoriesDal = diagnozCategoriesDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(DiagnozCategoriesValidator))]
        [RemoveCacheAspect("IDiagnozCategoriesService.Get")]

        public async Task<IResult> Add(DiagnozCategories diagnozCategories)
        {
            await _diagnozCategoriesDal.Add(diagnozCategories);
            return new SuccessResult(DiagnozCategoriesMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(DiagnozCategoriesValidator))]
        [RemoveCacheAspect("IDiagnozCategoriesService.Get")]

        public async Task<IResult> Update(DiagnozCategories diagnozCategories)
        {
            await _diagnozCategoriesDal.Update(diagnozCategories);
            return new SuccessResult(DiagnozCategoriesMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IDiagnozCategoriesService.Get")]

        public async Task<IResult> Delete(DiagnozCategories diagnozCategories)
        {
            await _diagnozCategoriesDal.Delete(diagnozCategories);
            return new SuccessResult(DiagnozCategoriesMessages.Deleted);
        }

        //[SecuredAspect()]
        //[CacheAspect()]
        //[PerformanceAspect()]
        public async Task<IDataResult<List<DiagnozCategories>>> GetList()
        {
            return new SuccessDataResult<List<DiagnozCategories>>(await _diagnozCategoriesDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<DiagnozCategories>> GetById(int id)
        {
            return new SuccessDataResult<DiagnozCategories>(await _diagnozCategoriesDal.Get(p => p.Id == id));
        }

    }
}
