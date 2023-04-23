using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountsTariffNamesCategoriesRepository.Validation
{
    public class AccountsTariffNamesCategoriesValidator : AbstractValidator<AccountsTariffNamesCategories>
    {
        public AccountsTariffNamesCategoriesValidator()
        {
        }
    }
}
