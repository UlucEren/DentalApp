using Business.Repositories.TDBCostNamesRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TDBCostNamesesController : ControllerBase
    {
        private readonly ITDBCostNamesService _tDBCostNamesService;

        public TDBCostNamesesController(ITDBCostNamesService tDBCostNamesService)
        {
            _tDBCostNamesService = tDBCostNamesService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(TDBCostNames tDBCostNames)
        {
            var result = await _tDBCostNamesService.Add(tDBCostNames);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(TDBCostNames tDBCostNames)
        {
            var result = await _tDBCostNamesService.Update(tDBCostNames);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(TDBCostNames tDBCostNames)
        {
            var result = await _tDBCostNamesService.Delete(tDBCostNames);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        //[HttpGet("[action]")]
        //public async Task<IActionResult> GetList()
        //{
        //    var result = await _tDBCostNamesService.GetList();
        //    if (result.Success)
        //    {
        //        return Ok(result);
        //    }
        //    return BadRequest(result.Message);
        //}

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _tDBCostNamesService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
