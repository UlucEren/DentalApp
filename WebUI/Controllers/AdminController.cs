using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
    [Authorize(Roles = "admin")]
    public class AdminController : BaseController
    {

        public AdminController(UserManager<AppUser> userManager, RoleManager<AppRole> roleManager) : base(userManager, null, roleManager)
        {
        }
        public IActionResult Users()
        {
            return View(userManager.Users.ToList());
        }
        public IActionResult Rol()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CreateUser(string name, string email, string password)
        {
            return View();
        }
        public JsonResult MailAvailable(string Email)
        {            
                bool available = userManager.Users.Any(x => x.Email == Email);
                return Json(available);
        }
    }
}
