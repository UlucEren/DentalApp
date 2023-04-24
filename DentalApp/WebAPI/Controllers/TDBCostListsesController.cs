using Business.Repositories.TDBCostListsRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TDBCostListsesController : ControllerBase
    {
        private readonly ITDBCostListsService _tDBCostListsService;

        public TDBCostListsesController(ITDBCostListsService tDBCostListsService)
        {
            _tDBCostListsService = tDBCostListsService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(TDBCostLists tDBCostLists)
        {
            var result = await _tDBCostListsService.Add(tDBCostLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(TDBCostLists tDBCostLists)
        {
            var result = await _tDBCostListsService.Update(tDBCostLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(TDBCostLists tDBCostLists)
        {
            var result = await _tDBCostListsService.Delete(tDBCostLists);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _tDBCostListsService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _tDBCostListsService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
