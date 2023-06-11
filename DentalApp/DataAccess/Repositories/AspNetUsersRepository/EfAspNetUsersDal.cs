using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.DataAccess.EntityFramework;
using Entities.Concrete;
using DataAccess.Repositories.AspNetUsersRepository;
using DataAccess.Context.EntityFramework;

namespace DataAccess.Repositories.AspNetUsersRepository
{
    public class EfAspNetUsersDal : EfEntityRepositoryBase<AspNetUsers, SimpleContextDb>, IAspNetUsersDal
    {
    }
}
