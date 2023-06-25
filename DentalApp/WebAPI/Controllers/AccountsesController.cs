using Business.Repositories.AccountsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsesController : ControllerBase
    {
        private readonly IAccountsService _accountsService;

        public AccountsesController(IAccountsService accountsService)
        {
            _accountsService = accountsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(Accounts accounts)
        {
            var result = await _accountsService.Add(accounts);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(Accounts accounts)
        {
            var result = await _accountsService.Update(accounts);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(Accounts accounts)
        {
            var result = await _accountsService.Delete(accounts);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        //[HttpGet("[action]/{id}")]
        //public async Task<IActionResult> GetById(int id)
        //{
        //    var result = await _accountsService.GetById(id);
        //    if (result.Success)
        //    {
        //        return Ok(result);
        //    }
        //    return BadRequest(result.Message);
        //}

    }
}
