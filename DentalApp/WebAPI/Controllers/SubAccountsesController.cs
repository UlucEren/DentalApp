using Business.Repositories.SubAccountsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubAccountsesController : ControllerBase
    {
        private readonly ISubAccountsService _subAccountsService;

        public SubAccountsesController(ISubAccountsService subAccountsService)
        {
            _subAccountsService = subAccountsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(SubAccounts subAccounts)
        {
            var result = await _subAccountsService.Add(subAccounts);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(SubAccounts subAccounts)
        {
            var result = await _subAccountsService.Update(subAccounts);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(SubAccounts subAccounts)
        {
            var result = await _subAccountsService.Delete(subAccounts);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _subAccountsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _subAccountsService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
