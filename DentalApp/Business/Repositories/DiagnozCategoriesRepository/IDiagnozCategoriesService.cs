using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.DiagnozCategoriesRepository
{
    public interface IDiagnozCategoriesService
    {
        Task<IResult> Add(DiagnozCategories diagnozCategories);
        Task<IResult> Update(DiagnozCategories diagnozCategories);
        Task<IResult> Delete(DiagnozCategories diagnozCategories);
        Task<IDataResult<List<DiagnozCategories>>> GetList();
        Task<IDataResult<DiagnozCategories>> GetById(int id);
    }
}
