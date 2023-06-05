using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountsRepository.Validation
{
    public class AccountsValidator : AbstractValidator<Accounts>
    {
        public AccountsValidator()
        {
        }
    }
}
