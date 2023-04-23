using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountsTariffNamesCategoriesRepository
{
    public interface IAccountsTariffNamesCategoriesService
    {
        Task<IResult> Add(AccountsTariffNamesCategories accountsTariffNamesCategories);
        Task<IResult> Update(AccountsTariffNamesCategories accountsTariffNamesCategories);
        Task<IResult> Delete(AccountsTariffNamesCategories accountsTariffNamesCategories);
        Task<IDataResult<List<AccountsTariffNamesCategories>>> GetList();
        Task<AccountsTariffNamesCategories> GetById(long id);
        Task<List<AccountsTariffNamesCategories>> GetByAccountsTariffNames_Id_Fk(long id);
        string GetCategoryName(long id);
    }
}
