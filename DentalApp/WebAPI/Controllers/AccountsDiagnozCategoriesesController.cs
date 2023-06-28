using Business.Repositories.AccountsDiagnozCategoriesRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsDiagnozCategoriesesController : ControllerBase
    {
        private readonly IAccountsDiagnozCategoriesService _accountsDiagnozCategoriesService;

        public AccountsDiagnozCategoriesesController(IAccountsDiagnozCategoriesService accountsDiagnozCategoriesService)
        {
            _accountsDiagnozCategoriesService = accountsDiagnozCategoriesService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountsDiagnozCategories accountsDiagnozCategories)
        {
            var result = await _accountsDiagnozCategoriesService.Add(accountsDiagnozCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountsDiagnozCategories accountsDiagnozCategories)
        {
            var result = await _accountsDiagnozCategoriesService.Update(accountsDiagnozCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountsDiagnozCategories accountsDiagnozCategories)
        {
            var result = await _accountsDiagnozCategoriesService.Delete(accountsDiagnozCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountsDiagnozCategoriesService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _accountsDiagnozCategoriesService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
