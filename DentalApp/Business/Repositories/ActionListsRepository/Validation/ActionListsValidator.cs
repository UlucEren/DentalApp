using System;
using System.Collections.Generic;
using FluentValidation;
using System.Text;
using System.Threading.Tasks;
using Entities.Concrete;

namespace Business.Repositories.ActionListRepository.Validation
{
    public class ActionListsValidator : AbstractValidator<ActionLists>
    {
        public ActionListsValidator()
        {
        }
    }
}
