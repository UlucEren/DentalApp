using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountsTariffNamesRepository
{
    public interface IAccountsTariffNamesService
    {
        Task<IResult> Add(AccountsTariffNames accountsTariffNames);
        Task<IResult> Update(AccountsTariffNames accountsTariffNames);
        Task<IResult> Delete(AccountsTariffNames accountsTariffNames);
        Task<IDataResult<List<AccountsTariffNames>>> GetList();
        Task<IDataResult<AccountsTariffNames>> GetById(long id);
        Task<List<AccountsTariffNames>> GetByAccountsIdList(string accountsId);
    }
}
