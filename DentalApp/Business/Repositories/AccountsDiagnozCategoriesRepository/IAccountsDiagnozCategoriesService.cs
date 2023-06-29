using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;
using Core.Utilities.Result.Abstract;

namespace Business.Repositories.AccountsDiagnozCategoriesRepository
{
    public interface IAccountsDiagnozCategoriesService
    {
        Task<IResult> Add(AccountsDiagnozCategories accountsDiagnozCategories);
        Task<IResult> Update(AccountsDiagnozCategories accountsDiagnozCategories);
        Task<IResult> Delete(AccountsDiagnozCategories accountsDiagnozCategories);
        Task<IDataResult<List<AccountsDiagnozCategories>>> GetList();
        Task<IDataResult<AccountsDiagnozCategories>> GetById(long id);
        Task<IDataResult<List<AccountsDiagnozCategories>>> GetByAccountsIdList(string AspNetUsersIdFk);
        string GetCategoryName(long id);
    }
}
