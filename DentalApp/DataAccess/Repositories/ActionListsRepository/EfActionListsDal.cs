using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.ActionListRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.ActionListRepository
{
    public class EfActionListsDal : EfEntityRepositoryBase<ActionLists, SimpleContextDb>, IActionListsDal
    {
    }
}
