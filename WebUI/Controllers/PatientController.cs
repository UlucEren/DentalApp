using Business.Repositories.AccountPatientsRepository;
using Business.Repositories.AccountsRepository;
using Business.Repositories.SubAccountsRepository;
using Castle.Components.DictionaryAdapter.Xml;
using DataAccess.Context.EntityFramework;
using DocumentFormat.OpenXml.Office2010.Excel;
using Entities.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System.Data;
using System.Security.Claims;
using System.Security.Principal;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
    [Authorize(Roles = "Hasta Modülü.Read")]
    public class PatientController : Controller
    {
        private readonly IAccountPatientsService _iAccountPatientsService;
        private readonly IAccountsService _iAccountsService;
        private readonly ISubAccountsService _iSubAccountsService;

        public PatientController(IAccountPatientsService iAccountPatientsService, IAccountsService iAccountsService, ISubAccountsService iSubAccountsService)
        {
            _iAccountPatientsService = iAccountPatientsService;
            _iAccountsService = iAccountsService;
            _iSubAccountsService = iSubAccountsService;
        }
        private async Task<string> findAccount(string _guid)
        {
            var subAccount = await _iSubAccountsService.GetByAspNetUsers_Id_Fk(_guid);
            if (subAccount.Data != null)
            {
                var _account = await _iAccountsService.GetByAspNetUsers_Id_Fk(subAccount.Data.Accounts_AspNetUsersIdFk_Fk);
                if (_account != null)
                {
                    return _account.Data.AspNetUsers_Id_Fk;
                }
                else
                    return "0";
            }
            else
            {
                var account = await _iAccountsService.GetByAspNetUsers_Id_Fk(_guid);
                if (account.Data != null)
                {
                    return account.Data.AspNetUsers_Id_Fk;
                }
                else
                    return "0";
            }
        }
        public async Task<IActionResult> Index()
        {
            string patientId = Request.Query["patientId"].SingleOrDefault();
            if (patientId != null)
            {
                Guid n;
                if (!Guid.TryParse(patientId, out n))
                {
                    return RedirectToAction("Error404");
                }
                // patient db bilgilerini getir
                // hasta kaydı varmı yok sa model boş olsun kayıt yapsın
                //current autokention id al
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
                string _findAccount = await findAccount(userId);
                if (_findAccount == "0")
                {
                    return RedirectToAction("Error404");
                }
                var patient = await _iAccountPatientsService.GetByPatient(patientId, _findAccount);
                if (patient.Data != null)
                {
                    ViewBag.PatientId = patient.Data.Id;
                }
                else
                    ViewBag.PatientId = "";
                return View(patient.Data);

            }
            else
            {
                //current autokention id al
                //db den hasta kaydı varmı kontrolunu yap
                //hasta bilgisi yoksa model boş olsun ki yeni kayıt yapılsın
                // db den en son giriş yapılan hastanın bilgilerini getir.				
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                string _findAccount = await findAccount(userId);

                if (_findAccount == "0")
                {
                    return RedirectToAction("Error404");
                }
                //// son görülen kaydı rahat yapabilmek için katmanlı mimari dışına çıkıldı. aksi taktirde tüm kaydı çekip son kayıt bulunacaktı
                using (var context = new SimpleContextDb())
                {
                    AccountPatients _patient = context.AccountPatients.Where(x => x.Accounts_AspNetUsersIdFk_Fk == _findAccount).OrderByDescending(x => x.LastAccessTime).FirstOrDefault()!;
                    if (_patient != null)
                    {
                        ViewBag.PatientId = _patient.Id;
                    }
                    else
                        ViewBag.PatientId = "";
                    return View(_patient);
                }
            }


            return View();
        }
        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Read")]
        public async Task<PartialViewResult> PatientIndexReadWidget(string patientId)
        {
            if (patientId != null)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                string _findAccount = await findAccount(userId);
                var result = await _iAccountPatientsService.GetByPatient(patientId, _findAccount);
                //AccountPatients patient = new AccountPatients();
                //patient.NameSurname = "Ferhat Işık";
                result.Data.LastAccessTime = DateTime.Now;
                await _iAccountPatientsService.Update(result.Data);
                ViewBag.PatientIndexUpdateWidgetSave = "/Patient/PatientIndexUpdateWidgetSave";
                return PartialView(result.Data);
            }
            else
            {
                return PartialView();
            }

        }
        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Create")]
        public PartialViewResult PatientIndexNewWidget()
        {
            AccountPatients patient = new AccountPatients();
            patient.NameSurname = "";
            ViewBag.PatientIndexNewWidgetSave = "/Patient/PatientIndexNewWidgetSave";
            return PartialView(patient);

        }
        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Create")]
        [HttpPost]
        public async Task<IActionResult> PatientIndexNewWidgetSave(AccountPatients patient)
        {
            string patientId = "";
            if (patient != null)
            {
                Guid guidId = Guid.NewGuid();
                patient.Id = guidId.ToString();
                patient.LastAccessTime = DateTime.Now;

                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
                string _findAccount = await findAccount(userId);
                patient.Accounts_AspNetUsersIdFk_Fk = _findAccount;               
                var result = await _iAccountPatientsService.Add(patient);                   
                
                patientId = patient.Id;                
            }
            //var jsonResult = new JsonResult(new { Result = result, PatientId = patientId });
            return RedirectToAction("Index", new { patientId = patientId });
        }

        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Update")]
        [HttpPost]
        public JsonResult PatientIndexUpdateWidgetSave(AccountPatients patient)
        {
            bool result = false;
            string patientId = "";
            if (patient != null)
            {
                patientId = "6b25f39f-c6ca-4b63-9539-eb693b65e38c";
                result = true;
            }
            var jsonResult = new JsonResult(new { Result = result, PatientId = patientId });
            return Json(jsonResult);
        }

        public IActionResult Oral()
        {
            return View();
        }
    }
}
