using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.TDBCostNamesRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.TDBCostNamesRepository.Validation;
using Business.Repositories.TDBCostNamesRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.TDBCostNamesRepository;

namespace Business.Repositories.TDBCostNamesRepository
{
    public class TDBCostNamesManager : ITDBCostNamesService
    {
        private readonly ITDBCostNamesDal _tDBCostNamesDal;

        public TDBCostNamesManager(ITDBCostNamesDal tDBCostNamesDal)
        {
            _tDBCostNamesDal = tDBCostNamesDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(TDBCostNamesValidator))]
        [RemoveCacheAspect("ITDBCostNamesService.Get")]

        public async Task<IResult> Add(TDBCostNames tDBCostNames)
        {
            await _tDBCostNamesDal.Add(tDBCostNames);
            return new SuccessResult(TDBCostNamesMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(TDBCostNamesValidator))]
        [RemoveCacheAspect("ITDBCostNamesService.Get")]

        public async Task<IResult> Update(TDBCostNames tDBCostNames)
        {
            await _tDBCostNamesDal.Update(tDBCostNames);
            return new SuccessResult(TDBCostNamesMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("ITDBCostNamesService.Get")]

        public async Task<IResult> Delete(TDBCostNames tDBCostNames)
        {
            await _tDBCostNamesDal.Delete(tDBCostNames);
            return new SuccessResult(TDBCostNamesMessages.Deleted);
        }

        //[SecuredAspect()]
        //[CacheAspect()]
        //[PerformanceAspect()]
        public async Task<List<TDBCostNames>> GetList()
        {
            return new List<TDBCostNames>(await _tDBCostNamesDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<TDBCostNames>> GetById(int id)
        {
            return new SuccessDataResult<TDBCostNames>(await _tDBCostNamesDal.Get(p => p.Id == id));
        }

    }
}
