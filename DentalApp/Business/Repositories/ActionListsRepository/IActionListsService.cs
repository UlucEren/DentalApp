using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.ActionListRepository
{
    public interface IActionListsService
    {
        Task<IResult> Add(ActionLists actionList);
        Task<IResult> Update(ActionLists actionList);
        Task<IResult> Delete(ActionLists actionList);
        Task<IDataResult<List<ActionLists>>> GetList();
        Task<IDataResult<ActionLists>> GetById(int id);
    }
}
