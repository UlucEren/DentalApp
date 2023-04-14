using Entities.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Data;
using System.Security.Claims;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
    
    public class SettingController : Controller
    {
        [Authorize(Roles = "Ayarlar Modülü » Tanımlamalar")]
        public IActionResult Tariff()
        {
            return View();
        }
    }
}
