using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.TDBCostNamesRepository
{
    public interface ITDBCostNamesService
    {
        Task<IResult> Add(TDBCostNames tDBCostNames);
        Task<IResult> Update(TDBCostNames tDBCostNames);
        Task<IResult> Delete(TDBCostNames tDBCostNames);
        Task<List<TDBCostNames>> GetList();
        Task<IDataResult<TDBCostNames>> GetById(int id);
    }
}
