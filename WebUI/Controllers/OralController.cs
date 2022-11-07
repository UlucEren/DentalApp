using Microsoft.AspNetCore.Mvc;

namespace WebUI.Controllers
{
    public class OralController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
