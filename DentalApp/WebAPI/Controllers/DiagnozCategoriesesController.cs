using Business.Repositories.DiagnozCategoriesRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiagnozCategoriesesController : ControllerBase
    {
        private readonly IDiagnozCategoriesService _diagnozCategoriesService;

        public DiagnozCategoriesesController(IDiagnozCategoriesService diagnozCategoriesService)
        {
            _diagnozCategoriesService = diagnozCategoriesService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(DiagnozCategories diagnozCategories)
        {
            var result = await _diagnozCategoriesService.Add(diagnozCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(DiagnozCategories diagnozCategories)
        {
            var result = await _diagnozCategoriesService.Update(diagnozCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(DiagnozCategories diagnozCategories)
        {
            var result = await _diagnozCategoriesService.Delete(diagnozCategories);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _diagnozCategoriesService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _diagnozCategoriesService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
