using Business.Repositories.DiagnozListsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiagnozListsesController : ControllerBase
    {
        private readonly IDiagnozListsService _diagnozListsService;

        public DiagnozListsesController(IDiagnozListsService diagnozListsService)
        {
            _diagnozListsService = diagnozListsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(DiagnozLists diagnozLists)
        {
            var result = await _diagnozListsService.Add(diagnozLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(DiagnozLists diagnozLists)
        {
            var result = await _diagnozListsService.Update(diagnozLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(DiagnozLists diagnozLists)
        {
            var result = await _diagnozListsService.Delete(diagnozLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _diagnozListsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _diagnozListsService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
