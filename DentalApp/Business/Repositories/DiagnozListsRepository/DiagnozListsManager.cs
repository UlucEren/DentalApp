using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.DiagnozListsRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.DiagnozListsRepository.Validation;
using Business.Repositories.DiagnozListsRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.DiagnozListsRepository;

namespace Business.Repositories.DiagnozListsRepository
{
    public class DiagnozListsManager : IDiagnozListsService
    {
        private readonly IDiagnozListsDal _diagnozListsDal;

        public DiagnozListsManager(IDiagnozListsDal diagnozListsDal)
        {
            _diagnozListsDal = diagnozListsDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(DiagnozListsValidator))]
        [RemoveCacheAspect("IDiagnozListsService.Get")]

        public async Task<IResult> Add(DiagnozLists diagnozLists)
        {
            await _diagnozListsDal.Add(diagnozLists);
            return new SuccessResult(DiagnozListsMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(DiagnozListsValidator))]
        [RemoveCacheAspect("IDiagnozListsService.Get")]

        public async Task<IResult> Update(DiagnozLists diagnozLists)
        {
            await _diagnozListsDal.Update(diagnozLists);
            return new SuccessResult(DiagnozListsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IDiagnozListsService.Get")]

        public async Task<IResult> Delete(DiagnozLists diagnozLists)
        {
            await _diagnozListsDal.Delete(diagnozLists);
            return new SuccessResult(DiagnozListsMessages.Deleted);
        }

        [SecuredAspect()]
        [CacheAspect()]
        [PerformanceAspect()]
        public async Task<IDataResult<List<DiagnozLists>>> GetList()
        {
            return new SuccessDataResult<List<DiagnozLists>>(await _diagnozListsDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<DiagnozLists>> GetById(int id)
        {
            return new SuccessDataResult<DiagnozLists>(await _diagnozListsDal.Get(p => p.Id == id));
        }

        public async Task<IDataResult<List<DiagnozLists>>> GetByDiagnozCategories_Id_Fk(int id)
        {
            return new SuccessDataResult<List<DiagnozLists>>(await _diagnozListsDal.GetAll(x=>x.DiagnozCategories_Id_Fk==id));
        }

    }
}
