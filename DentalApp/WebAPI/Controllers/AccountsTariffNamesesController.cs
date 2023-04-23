using Business.Repositories.AccountsTariffNamesRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsTariffNamesesController : ControllerBase
    {
        private readonly IAccountsTariffNamesService _accountsTariffNamesService;

        public AccountsTariffNamesesController(IAccountsTariffNamesService accountsTariffNamesService)
        {
            _accountsTariffNamesService = accountsTariffNamesService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountsTariffNames accountsTariffNames)
        {
            var result = await _accountsTariffNamesService.Add(accountsTariffNames);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountsTariffNames accountsTariffNames)
        {
            var result = await _accountsTariffNamesService.Update(accountsTariffNames);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountsTariffNames accountsTariffNames)
        {
            var result = await _accountsTariffNamesService.Delete(accountsTariffNames);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountsTariffNamesService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _accountsTariffNamesService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
