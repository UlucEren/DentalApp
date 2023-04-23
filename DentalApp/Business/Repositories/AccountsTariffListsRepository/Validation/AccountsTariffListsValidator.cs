using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountsTariffListsRepository.Validation
{
    public class AccountsTariffListsValidator : AbstractValidator<AccountsTariffLists>
    {
        public AccountsTariffListsValidator()
        {
        }
    }
}
