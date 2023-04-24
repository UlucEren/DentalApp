using Business.Repositories.TDBCostNameCategoriesRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TDBCostNameCategoriesesController : ControllerBase
    {
        private readonly ITDBCostNameCategoriesService _tDBCostNameCategoriesService;

        public TDBCostNameCategoriesesController(ITDBCostNameCategoriesService tDBCostNameCategoriesService)
        {
            _tDBCostNameCategoriesService = tDBCostNameCategoriesService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(TDBCostNameCategories tDBCostNameCategories)
        {
            var result = await _tDBCostNameCategoriesService.Add(tDBCostNameCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(TDBCostNameCategories tDBCostNameCategories)
        {
            var result = await _tDBCostNameCategoriesService.Update(tDBCostNameCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(TDBCostNameCategories tDBCostNameCategories)
        {
            var result = await _tDBCostNameCategoriesService.Delete(tDBCostNameCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _tDBCostNameCategoriesService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _tDBCostNameCategoriesService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
