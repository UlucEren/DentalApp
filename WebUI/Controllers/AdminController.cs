using Entities.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebUI.Models.AppIdentityDb;
using Microsoft.EntityFrameworkCore;

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
        public async Task<IActionResult> Rol()
        {
            var roles = await roleManager.Roles.Select(x => new RoleViewModelDto()
            {
                Id = x.Id,
                Name = x.Name!
            }).ToListAsync();
            return View(roles);
        }
        [HttpPost]
        public async Task<IActionResult> CreateUser(string name, string email,string phone, string password)
        {
            AppUser user = new AppUser();
            user.UserName = name;
            user.Email = email;
            user.PhoneNumber = phone;

            IdentityResult result = await userManager.CreateAsync(user, password);
            return RedirectToAction("Users");
        }

        [HttpPost]
        public async Task<IActionResult> CreateRol(string name)
        {
            AppRole rol = new AppRole();
            rol.Name = name;

            IdentityResult result = await roleManager.CreateAsync(rol);
            return RedirectToAction("Rol");
        }
      [HttpPost]
        public async Task<IActionResult> UpdateRol(string name,string id)
        {
            AppRole rol = await roleManager.FindByIdAsync(id);
            rol.Name = name;

            IdentityResult result = await roleManager.UpdateAsync(rol);
            return RedirectToAction("Rol");
        }
       public async Task<IActionResult> DeleteRol(string id)
        {
            AppRole rol = await roleManager.FindByIdAsync(id);            

            IdentityResult result = await roleManager.DeleteAsync(rol);
            return RedirectToAction("Rol");
        }
        public JsonResult MailAvailable(string Email)
        {            
                bool available = userManager.Users.Any(x => x.Email == Email);
                return Json(available);
        }
        public JsonResult RolAvailable(string rol)
        {            
                bool available = roleManager.Roles.Any(x=>x.Name==rol);
                return Json(available);
        }
    }
}
