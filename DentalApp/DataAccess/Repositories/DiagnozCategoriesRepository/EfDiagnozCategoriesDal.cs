using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.DiagnozCategoriesRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.DiagnozCategoriesRepository
{
    public class EfDiagnozCategoriesDal : EfEntityRepositoryBase<DiagnozCategories, SimpleContextDb>, IDiagnozCategoriesDal
    {
    }
}
