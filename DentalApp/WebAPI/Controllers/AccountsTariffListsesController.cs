using Business.Repositories.AccountsTariffListsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsTariffListsesController : ControllerBase
    {
        private readonly IAccountsTariffListsService _accountsTariffListsService;

        public AccountsTariffListsesController(IAccountsTariffListsService accountsTariffListsService)
        {
            _accountsTariffListsService = accountsTariffListsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountsTariffLists accountsTariffLists)
        {
            var result = await _accountsTariffListsService.Add(accountsTariffLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountsTariffLists accountsTariffLists)
        {
            var result = await _accountsTariffListsService.Update(accountsTariffLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountsTariffLists accountsTariffLists)
        {
            var result = await _accountsTariffListsService.Delete(accountsTariffLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountsTariffListsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _accountsTariffListsService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
