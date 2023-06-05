using Business.Repositories.AccountPatientsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountPatientsesController : ControllerBase
    {
        private readonly IAccountPatientsService _accountPatientsService;

        public AccountPatientsesController(IAccountPatientsService accountPatientsService)
        {
            _accountPatientsService = accountPatientsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountPatients accountPatients)
        {
            var result = await _accountPatientsService.Add(accountPatients);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountPatients accountPatients)
        {
            var result = await _accountPatientsService.Update(accountPatients);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountPatients accountPatients)
        {
            var result = await _accountPatientsService.Delete(accountPatients);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountPatientsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        //[HttpGet("[action]/{id}")]
        //public async Task<IActionResult> GetById(int id)
        //{
        //    var result = await _accountPatientsService.GetById(id);
        //    if (result.Success)
        //    {
        //        return Ok(result);
        //    }
        //    return BadRequest(result.Message);
        //}

    }
}
