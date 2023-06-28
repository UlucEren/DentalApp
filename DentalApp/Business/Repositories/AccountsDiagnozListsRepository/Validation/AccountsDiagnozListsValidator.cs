using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountsDiagnozListsRepository.Validation
{
    public class AccountsDiagnozListsValidator : AbstractValidator<AccountsDiagnozLists>
    {
        public AccountsDiagnozListsValidator()
        {
        }
    }
}
