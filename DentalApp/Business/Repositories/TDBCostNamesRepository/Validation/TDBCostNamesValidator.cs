using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.TDBCostNamesRepository.Validation
{
    public class TDBCostNamesValidator : AbstractValidator<TDBCostNames>
    {
        public TDBCostNamesValidator()
        {
        }
    }
}
