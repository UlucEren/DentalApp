using Business.Repositories.AccountTreatmentsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountTreatmentsesController : ControllerBase
    {
        private readonly IAccountTreatmentsService _accountTreatmentsService;

        public AccountTreatmentsesController(IAccountTreatmentsService accountTreatmentsService)
        {
            _accountTreatmentsService = accountTreatmentsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountTreatments accountTreatments)
        {
            var result = await _accountTreatmentsService.Add(accountTreatments);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountTreatments accountTreatments)
        {
            var result = await _accountTreatmentsService.Update(accountTreatments);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountTreatments accountTreatments)
        {
            var result = await _accountTreatmentsService.Delete(accountTreatments);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountTreatmentsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _accountTreatmentsService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
