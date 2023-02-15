using Business.Abstract;
using Business.Repositories.UserRepository;
using Castle.Core.Smtp;
using Entities.Dtos;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
	public class AccountController : Controller
	{
		private UserManager<AppUser> _userManager;
		private SignInManager<AppUser> _signInManager;
		public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
		{
			_userManager = userManager;
			_signInManager = signInManager;
		}
		public IActionResult Login(string ReturnUrl = null)
		{
			return View(new LoginAuthDto()
			{
				ReturnUrl = ReturnUrl
			});
		}
		[HttpPost]
		public async Task<IActionResult> Login(LoginAuthDto model, string remember)
		{
			if (!ModelState.IsValid)
			{
				return View(model);
			}
			var user = await _userManager.FindByEmailAsync(model.Email);

			if (user == null)
			{
				ModelState.AddModelError("", "Bu email ile daha önce hesap oluşturulmamış.");
				return View(model);
			}

			if (!await _userManager.IsEmailConfirmedAsync(user))
			{
				ModelState.AddModelError("", "Lütfen hesabınızı email ile onaylayınız.");
				return View(model);
			}

			bool _remember = (remember == "on") ? true : false;
			var result = await _signInManager.PasswordSignInAsync(user, model.Password, _remember, false);

			if (result.Succeeded)
			{
				return Redirect(model.ReturnUrl ?? "~/");
			}

			ModelState.AddModelError("", "Email veya parola yanlış");
			return View(model);
		}

		public async Task<IActionResult> Logout()
		{
			//await _signInManager.SignOutAsync();

			//TempData.Put("message", new ResultMessage()
			//{
			//	Title = "Oturum Kapatıldı.",
			//	Message = "Hesabınız güvenli bir şekilde sonlandırıldı.",
			//	Css = "warning"
			//});

			return Redirect("~/");
		}
		public IActionResult Accessdenied()
		{
			return View();
		}
	}
}
