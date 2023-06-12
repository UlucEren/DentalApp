using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Repositories.AspNetUsersRepository;
using Entities.Concrete;
using Business.Aspects.Secured;
using Core.Aspects.Validation;
using Core.Aspects.Caching;
using Core.Aspects.Performance;
using Business.Repositories.AspNetUsersRepository.Validation;
using Business.Repositories.AspNetUsersRepository.Constants;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Repositories.AspNetUsersRepository;

namespace Business.Repositories.AspNetUsersRepository
{
    public class AspNetUsersManager : IAspNetUsersService
    {
        private readonly IAspNetUsersDal _aspNetUsersDal;

        public AspNetUsersManager(IAspNetUsersDal aspNetUsersDal)
        {
            _aspNetUsersDal = aspNetUsersDal;
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AspNetUsersValidator))]
        [RemoveCacheAspect("IAspNetUsersService.Get")]

        public async Task<IResult> Add(AspNetUsers aspNetUsers)
        {
            await _aspNetUsersDal.Add(aspNetUsers);
            return new SuccessResult(AspNetUsersMessages.Added);
        }

        [SecuredAspect()]
        [ValidationAspect(typeof(AspNetUsersValidator))]
        [RemoveCacheAspect("IAspNetUsersService.Get")]

        public async Task<IResult> Update(AspNetUsers aspNetUsers)
        {
            await _aspNetUsersDal.Update(aspNetUsers);
            return new SuccessResult(AspNetUsersMessages.Updated);
        }

        [SecuredAspect()]
        [RemoveCacheAspect("IAspNetUsersService.Get")]

        public async Task<IResult> Delete(AspNetUsers aspNetUsers)
        {
            await _aspNetUsersDal.Delete(aspNetUsers);
            return new SuccessResult(AspNetUsersMessages.Deleted);
        }

        //[SecuredAspect()]
        //[CacheAspect()]
        //[PerformanceAspect()]
        public async Task<IDataResult<List<AspNetUsers>>> GetList()
        {
            return new SuccessDataResult<List<AspNetUsers>>(await _aspNetUsersDal.GetAll());
        }

        //[SecuredAspect()]
        public async Task<IDataResult<AspNetUsers>> GetById(string id)
        {
            return new SuccessDataResult<AspNetUsers>(await _aspNetUsersDal.Get(p => p.Id == id));
        }
        public string GetUserName(string id)
        {
            var temp = _aspNetUsersDal.GetSync(p => p.Id == id);
            string Name = temp.UserName;
            return Name;
        }

    }
}
