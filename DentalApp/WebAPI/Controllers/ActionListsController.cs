using Business.Repositories.ActionListRepository;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActionListsController : ControllerBase
    {
        private readonly IActionListsService _actionListService;

        public ActionListsController(IActionListsService actionListService)
        {
            _actionListService = actionListService;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Add(ActionLists actionList)
        {
            var result = await _actionListService.Add(actionList);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Update(ActionLists actionList)
        {
            var result = await _actionListService.Update(actionList);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> Delete(ActionLists actionList)
        {
            var result = await _actionListService.Delete(actionList);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetList()
        {
            var result = await _actionListService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _actionListService.GetById(id);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }

    }
}
