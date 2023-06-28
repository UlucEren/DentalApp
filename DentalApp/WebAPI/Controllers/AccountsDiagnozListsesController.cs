using Business.Repositories.AccountsDiagnozListsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsDiagnozListsesController : ControllerBase
    {
        private readonly IAccountsDiagnozListsService _accountsDiagnozListsService;

        public AccountsDiagnozListsesController(IAccountsDiagnozListsService accountsDiagnozListsService)
        {
            _accountsDiagnozListsService = accountsDiagnozListsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountsDiagnozLists accountsDiagnozLists)
        {
            var result = await _accountsDiagnozListsService.Add(accountsDiagnozLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountsDiagnozLists accountsDiagnozLists)
        {
            var result = await _accountsDiagnozListsService.Update(accountsDiagnozLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountsDiagnozLists accountsDiagnozLists)
        {
            var result = await _accountsDiagnozListsService.Delete(accountsDiagnozLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountsDiagnozListsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _accountsDiagnozListsService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
