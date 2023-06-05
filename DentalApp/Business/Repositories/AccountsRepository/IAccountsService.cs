using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountsRepository
{
    public interface IAccountsService
    {
        Task<IResult> Add(Accounts accounts);
        Task<IResult> Update(Accounts accounts);
        Task<IResult> Delete(Accounts accounts);
        Task<IDataResult<List<Accounts>>> GetList();
        Task<IDataResult<Accounts>> GetByAspNetUsers_Id_Fk(string id);
    }
}
