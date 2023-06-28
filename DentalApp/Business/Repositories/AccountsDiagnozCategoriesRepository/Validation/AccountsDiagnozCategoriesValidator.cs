using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountsDiagnozCategoriesRepository.Validation
{
    public class AccountsDiagnozCategoriesValidator : AbstractValidator<AccountsDiagnozCategories>
    {
        public AccountsDiagnozCategoriesValidator()
        {
        }
    }
}
