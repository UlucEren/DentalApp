using Business.Repositories.AspNetUsersRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AspNetUsersesController : ControllerBase
    {
        private readonly IAspNetUsersService _aspNetUsersService;

        public AspNetUsersesController(IAspNetUsersService aspNetUsersService)
        {
            _aspNetUsersService = aspNetUsersService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(AspNetUsers aspNetUsers)
        {
            var result = await _aspNetUsersService.Add(aspNetUsers);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(AspNetUsers aspNetUsers)
        {
            var result = await _aspNetUsersService.Update(aspNetUsers);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(AspNetUsers aspNetUsers)
        {
            var result = await _aspNetUsersService.Delete(aspNetUsers);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _aspNetUsersService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _aspNetUsersService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
