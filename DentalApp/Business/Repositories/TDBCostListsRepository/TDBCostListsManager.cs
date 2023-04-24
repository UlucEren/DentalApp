using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.TDBCostListsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.TDBCostListsRepository.Validation;
using Business.Repositories.TDBCostListsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.TDBCostListsRepository;

namespace Business.Repositories.TDBCostListsRepository
{
    public class TDBCostListsManager : ITDBCostListsService
    {
        private readonly ITDBCostListsDal _tDBCostListsDal;

        public TDBCostListsManager(ITDBCostListsDal tDBCostListsDal)
        {
            _tDBCostListsDal = tDBCostListsDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(TDBCostListsValidator))]
        [RemoveCacheAspect("ITDBCostListsService.Get")]

        public async Task<IResult> Add(TDBCostLists tDBCostLists)
        {
            await _tDBCostListsDal.Add(tDBCostLists);
            return new SuccessResult(TDBCostListsMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(TDBCostListsValidator))]
        [RemoveCacheAspect("ITDBCostListsService.Get")]

        public async Task<IResult> Update(TDBCostLists tDBCostLists)
        {
            await _tDBCostListsDal.Update(tDBCostLists);
            return new SuccessResult(TDBCostListsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("ITDBCostListsService.Get")]

        public async Task<IResult> Delete(TDBCostLists tDBCostLists)
        {
            await _tDBCostListsDal.Delete(tDBCostLists);
            return new SuccessResult(TDBCostListsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<TDBCostLists>>> GetList()
        {
            return new SuccessDataResult<List<TDBCostLists>>(await _tDBCostListsDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<TDBCostLists>> GetById(int id)
        {
            return new SuccessDataResult<TDBCostLists>(await _tDBCostListsDal.Get(p => p.Id == id));
        }

        public async Task<List<TDBCostLists>> GetListByCategories_Id(long id)
        {
            return new List<TDBCostLists>(await _tDBCostListsDal.GetAll(p => p.TDBCostNameCategories_Id_Fk == id));

        }
    }
}
