using Entities.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebUI.Models.AppIdentityDb;
using Microsoft.EntityFrameworkCore;
using Business.Repositories.UserRepository;
using Entities.Concrete;
using Microsoft.Extensions.Options;

namespace WebUI.Controllers
{
    [Authorize(Roles = "admin")]
    public class AdminController : BaseController
    {
        private readonly IConfiguration _configuration;
        public AdminController(UserManager<AppUser> userManager, RoleManager<AppRole> roleManager, IConfiguration configuration) : base(userManager, null, roleManager)
        {
            _configuration = configuration;
        }
        public IActionResult Users()
        {
            return View(userManager.Users.ToList());
        }
        public async Task<IActionResult> Rol()
        {
            DbContextOptionsBuilder<AppIdentityDbContext> optionsBuilder = new DbContextOptionsBuilder<AppIdentityDbContext>();
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DefaultConnectionString"));
            DbContextOptions<AppIdentityDbContext> options = optionsBuilder.Options;
            AppIdentityDbContext context = new AppIdentityDbContext(options);           
                
            var roles = await context.Roles                
                .Select(x => new RoleViewModelDto()
            {
                Id = x.Id,
                Name = x.Name!,
                TableIndex= (context.RoleTableIndexs.Where(a => a.RoleId == x.Id).SingleOrDefault().TableIndex != null) ? context.RoleTableIndexs.Where(a => a.RoleId == x.Id).SingleOrDefault().TableIndex : 0
                }).ToListAsync();
            return View(roles);
        }
        [HttpPost]
        public async Task<IActionResult> CreateRol(string name,float? tableIndex)
        {
            DbContextOptionsBuilder<AppIdentityDbContext> optionsBuilder = new DbContextOptionsBuilder<AppIdentityDbContext>();
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DefaultConnectionString"));
            DbContextOptions<AppIdentityDbContext> options = optionsBuilder.Options;
            AppIdentityDbContext context = new AppIdentityDbContext(options);
            AppRole rol = new AppRole();
            rol.Name = name;

            IdentityResult result = await roleManager.CreateAsync(rol);
            if (result.Succeeded)
            {
                // Yeni oluşturulan rolün Id özelliğine erişim                
                RoleTableIndexs roleTableIndexs = new RoleTableIndexs();
                roleTableIndexs.RoleId = rol.Id;
                roleTableIndexs.TableIndex = (float)tableIndex;
                context.RoleTableIndexs.Add(roleTableIndexs);
                context.SaveChanges();
                // Diğer işlemler burada yer alacak
            }
            //else
            //{
            //    // Hata işleme burada yer alacak
            //}
            return RedirectToAction("Rol");
        }

        [HttpPost]
        public async Task<IActionResult> UpdateRol(string name, string id, float tableIndex)
        {
            AppRole rol = await roleManager.FindByIdAsync(id);
            rol.Name = name;
            //RoleTableIndexs indexs= new RoleTableIndexs();
            //indexs.RoleId = rol.Id;
            //indexs.TableIndex = tableIndex;
            DbContextOptionsBuilder<AppIdentityDbContext> optionsBuilder = new DbContextOptionsBuilder<AppIdentityDbContext>();
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DefaultConnectionString"));
            DbContextOptions<AppIdentityDbContext> options = optionsBuilder.Options;
            using (AppIdentityDbContext context = new AppIdentityDbContext(options))
            {
                if(context.RoleTableIndexs.Any(x => x.RoleId == id)) {
                    RoleTableIndexs indexs = context.RoleTableIndexs.Where(x => x.RoleId == id).FirstOrDefault();
                    indexs.TableIndex= tableIndex;
                    context.RoleTableIndexs.Update(indexs);
                    context.SaveChanges();
                }
                else
                {
                    RoleTableIndexs indexs = new RoleTableIndexs();
                    indexs.TableIndex = tableIndex;
                    indexs.RoleId= id;  
                    context.RoleTableIndexs.Add(indexs);
                    context.SaveChanges();
                }
            }

            IdentityResult result = await roleManager.UpdateAsync(rol);
            return RedirectToAction("Rol");
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

        public async Task<IActionResult> AssignRoleToUser(string id)
        {
            var currentUser = (await userManager.FindByIdAsync(id))!;
            ViewBag.userId = id;
            var roles = await roleManager.Roles.ToListAsync();
            var userRoles = await userManager.GetRolesAsync(currentUser);
            var roleViewModelList = new List<AssignRoleToUserViewModel>();

            foreach (var role in roles)
            {

                var assignRoleToUserViewModel = new AssignRoleToUserViewModel(role.Id,role.Name!, false, 0 );


                if (userRoles.Contains(role.Name!))
                {
                    assignRoleToUserViewModel.Exist = true;
                }

                roleViewModelList.Add(assignRoleToUserViewModel);


            }

            return View(roleViewModelList);
            //return View();
        }

        [HttpPost]
        public async Task<IActionResult> AssignRoleToUser(/*string userId, List<AssignRoleToUserViewModel> requestList*/)
        {

            //var userToAssignRoles = (await _userManager.FindByIdAsync(userId))!;

            //foreach (var role in requestList)
            //{

            //    if (role.Exist)
            //    {
            //        await _userManager.AddToRoleAsync(userToAssignRoles, role.Name);

            //    }
            //    else
            //    {
            //        await _userManager.RemoveFromRoleAsync(userToAssignRoles, role.Name);
            //    }

            //}

            //return RedirectToAction(nameof(HomeController.UserList), "Home");
            return View();
        }
    }

}
