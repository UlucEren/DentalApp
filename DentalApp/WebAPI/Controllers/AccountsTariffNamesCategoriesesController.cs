using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsTariffNamesCategoriesesController : ControllerBase
    {
        private readonly IAccountsTariffNamesCategoriesService _accountsTariffNamesCategoriesService;

        public AccountsTariffNamesCategoriesesController(IAccountsTariffNamesCategoriesService accountsTariffNamesCategoriesService)
        {
            _accountsTariffNamesCategoriesService = accountsTariffNamesCategoriesService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AccountsTariffNamesCategories accountsTariffNamesCategories)
        {
            var result = await _accountsTariffNamesCategoriesService.Add(accountsTariffNamesCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AccountsTariffNamesCategories accountsTariffNamesCategories)
        {
            var result = await _accountsTariffNamesCategoriesService.Update(accountsTariffNamesCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AccountsTariffNamesCategories accountsTariffNamesCategories)
        {
            var result = await _accountsTariffNamesCategoriesService.Delete(accountsTariffNamesCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _accountsTariffNamesCategoriesService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        //[HttpGet("[action]/{id}")]
        //public async Task<IActionResult> GetById(int id)
        //{
        //    var result = await _accountsTariffNamesCategoriesService.GetById(id);
        //    if (result.Success)
        //    {
        //        return Ok(result);
        //    }
        //    return BadRequest(result.Message);
        //}

    }
}
