using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.TDBCostNameCategoriesRepository
{
    public interface ITDBCostNameCategoriesService
    {
        Task<IResult> Add(TDBCostNameCategories tDBCostNameCategories);
        Task<IResult> Update(TDBCostNameCategories tDBCostNameCategories);
        Task<IResult> Delete(TDBCostNameCategories tDBCostNameCategories);
        Task<IDataResult<List<TDBCostNameCategories>>> GetList();
        Task<IDataResult<TDBCostNameCategories>> GetById(int id);
        Task<List<TDBCostNameCategories>> GetByTDBCostNames_Id_Fk(long id);
    }
}
