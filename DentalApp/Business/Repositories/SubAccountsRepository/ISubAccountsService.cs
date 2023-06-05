using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.SubAccountsRepository
{
    public interface ISubAccountsService
    {
        Task<IResult> Add(SubAccounts subAccounts);
        Task<IResult> Update(SubAccounts subAccounts);
        Task<IResult> Delete(SubAccounts subAccounts);
        Task<IDataResult<List<SubAccounts>>> GetList();
        Task<IDataResult<SubAccounts>> GetById(int id);        
        Task<IDataResult<SubAccounts>> GetByAspNetUsers_Id_Fk(string id);        
    }
}
