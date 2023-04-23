using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountsTariffNamesRepository.Validation
{
    public class AccountsTariffNamesValidator : AbstractValidator<AccountsTariffNames>
    {
        public AccountsTariffNamesValidator()
        {
        }
    }
}
