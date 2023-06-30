using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountsDiagnozListsRepository
{
    public interface IAccountsDiagnozListsService
    {
        Task<IResult> Add(AccountsDiagnozLists accountsDiagnozLists);
        Task<IResult> Update(AccountsDiagnozLists accountsDiagnozLists);
        Task<IResult> Delete(AccountsDiagnozLists accountsDiagnozLists);
        Task<IDataResult<List<AccountsDiagnozLists>>> GetList();
        Task<IDataResult<AccountsDiagnozLists>> GetById(string id);
        Task<List<AccountsDiagnozLists>> GetListByCategories_Id(long id);
    }
}
