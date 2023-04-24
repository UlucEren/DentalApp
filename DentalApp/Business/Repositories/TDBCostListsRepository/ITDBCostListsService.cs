using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.TDBCostListsRepository
{
    public interface ITDBCostListsService
    {
        Task<IResult> Add(TDBCostLists tDBCostLists);
        Task<IResult> Update(TDBCostLists tDBCostLists);
        Task<IResult> Delete(TDBCostLists tDBCostLists);
        Task<IDataResult<List<TDBCostLists>>> GetList();
        Task<IDataResult<TDBCostLists>> GetById(int id);
        Task<List<TDBCostLists>> GetListByCategories_Id(long id);
    }
}
