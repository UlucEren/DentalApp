using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.SubAccountsRepository.Validation
{
    public class SubAccountsValidator : AbstractValidator<SubAccounts>
    {
        public SubAccountsValidator()
        {
        }
    }
}
