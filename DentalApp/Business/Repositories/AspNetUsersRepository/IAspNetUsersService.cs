using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AspNetUsersRepository
{
    public interface IAspNetUsersService
    {
        Task<IResult> Add(AspNetUsers aspNetUsers);
        Task<IResult> Update(AspNetUsers aspNetUsers);
        Task<IResult> Delete(AspNetUsers aspNetUsers);
        Task<IDataResult<List<AspNetUsers>>> GetList();
        Task<IDataResult<AspNetUsers>> GetById(string id);
        string GetUserName(string id);
    }
}
