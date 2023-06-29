using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.DiagnozListsRepository.Validation
{
    public class DiagnozListsValidator : AbstractValidator<DiagnozLists>
    {
        public DiagnozListsValidator()
        {
        }
    }
}
