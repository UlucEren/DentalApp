using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.DiagnozListsRepository
{
    public interface IDiagnozListsService
    {
        Task<IResult> Add(DiagnozLists diagnozLists);
        Task<IResult> Update(DiagnozLists diagnozLists);
        Task<IResult> Delete(DiagnozLists diagnozLists);
        Task<IDataResult<List<DiagnozLists>>> GetList();
        Task<IDataResult<DiagnozLists>> GetById(int id);
        Task<IDataResult<List<DiagnozLists>>> GetByDiagnozCategories_Id_Fk(int id);
    }
}
