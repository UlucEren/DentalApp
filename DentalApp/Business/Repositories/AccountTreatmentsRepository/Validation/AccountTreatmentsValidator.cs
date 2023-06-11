using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.AccountTreatmentsRepository.Validation
{
    public class AccountTreatmentsValidator : AbstractValidator<AccountTreatments>
    {
        public AccountTreatmentsValidator()
        {
        }
    }
}
