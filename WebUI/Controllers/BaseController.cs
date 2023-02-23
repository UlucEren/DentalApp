using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
    public class BaseController : Controller
    {
        protected UserManager<AppUser> userManager { get; }
        protected SignInManager<AppUser> signInManager { get; }

        protected RoleManager<AppRole> roleManager { get; }

        protected AppUser CurrentUser => userManager.FindByNameAsync(User.Identity.Name).Result;
        //protected async Task<AppUser?> GetCurrentUserAsync()
        //{
        //    if (User?.Identity?.Name != null)
        //    {
        //        return await userManager.FindByNameAsync(User.Identity.Name);
        //    }
        //    else
        //    {
        //        return null;
        //    }
            
        //}
        //protected async Task<AppUser> CurrentUser()
        //{
        //    return await GetCurrentUserAsync();
        //}

        public BaseController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<AppRole> roleManager = null)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.roleManager = roleManager;
        }

        public void AddModelError(IdentityResult result)
        {
            foreach (var item in result.Errors)
            {
                ModelState.AddModelError("", item.Description);
            }
        }
    }
}
