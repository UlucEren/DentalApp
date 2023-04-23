using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountsTariffListsRepository
{
    public interface IAccountsTariffListsService
    {
        Task<IResult> Add(AccountsTariffLists accountsTariffLists);
        Task<IResult> Update(AccountsTariffLists accountsTariffLists);
        Task<IResult> Delete(AccountsTariffLists accountsTariffLists);
        Task<IDataResult<List<AccountsTariffLists>>> GetList();
        Task<IDataResult<AccountsTariffLists>> GetById(int id);
        Task<List<AccountsTariffLists>> GetListByCategories_Id(long id);
    }
}
