using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.ActionListRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.ActionListRepository.Validation;
using Business.Repositories.ActionListRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.ActionListRepository;

namespace Business.Repositories.ActionListRepository
{
    public class ActionListsManager : IActionListsService
    {
        private readonly IActionListsDal _actionListsDal;

        public ActionListsManager(IActionListsDal actionListDal)
        {
            _actionListsDal = actionListDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(ActionListsValidator))]
        [RemoveCacheAspect("IActionListService.Get")]

        public async Task<IResult> Add(ActionLists actionList)
        {
            await _actionListsDal.Add(actionList);
            return new SuccessResult(ActionListsMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(ActionListsValidator))]
        [RemoveCacheAspect("IActionListService.Get")]

        public async Task<IResult> Update(ActionLists actionList)
        {
            await _actionListsDal.Update(actionList);
            return new SuccessResult(ActionListsMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IActionListService.Get")]

        public async Task<IResult> Delete(ActionLists actionList)
        {
            await _actionListsDal.Delete(actionList);
            return new SuccessResult(ActionListsMessages.Deleted);
        }

        //[SecuredAspect()]
        //[CacheAspect()]
        //[PerformanceAspect()]
        public async Task<IDataResult<List<ActionLists>>> GetList()
        {
            return new SuccessDataResult<List<ActionLists>>(await _actionListsDal.GetAll());
        }

        [SecuredAspect()]
        public async Task<IDataResult<ActionLists>> GetById(int id)
        {
            return new SuccessDataResult<ActionLists>(await _actionListsDal.Get(p => p.Id == id));
        }

    }
}
