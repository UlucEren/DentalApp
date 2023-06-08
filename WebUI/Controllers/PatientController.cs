using Business.Repositories.AccountPatientsRepository;
using Business.Repositories.AccountsRepository;
using Business.Repositories.AccountsTariffListsRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffNamesRepository;
using Business.Repositories.ActionListRepository;
using Business.Repositories.SubAccountsRepository;
using Castle.Components.DictionaryAdapter.Xml;
using DataAccess.Context.EntityFramework;
using DocumentFormat.OpenXml.Office2010.Excel;
using Entities.Concrete;
using Entities.Dtos;
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
        private readonly IActionListsService _iActionListService;
        private readonly IAccountsTariffNamesService _accountsTariffNamesService;
        private readonly IAccountsTariffNamesCategoriesService _accountsTariffNamesCategoriesService;
        private readonly IAccountsTariffListsService _accountsTariffListsService;

        public PatientController(IAccountPatientsService iAccountPatientsService, IAccountsService iAccountsService, ISubAccountsService iSubAccountsService, IActionListsService iActionListService, IAccountsTariffNamesService iAccountsTariffNamesService, IAccountsTariffNamesCategoriesService accountsTariffNamesCategoriesService, IAccountsTariffListsService accountsTariffListsService)
        {
            _iAccountPatientsService = iAccountPatientsService;
            _iAccountsService = iAccountsService;
            _iSubAccountsService = iSubAccountsService;
            _iActionListService = iActionListService;
            _accountsTariffNamesService = iAccountsTariffNamesService;
            _accountsTariffNamesCategoriesService = accountsTariffNamesCategoriesService;
            _accountsTariffListsService = accountsTariffListsService;
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
            //return RedirectToAction("Index", new { patientId = patientId });
            return Redirect($"/Patient/Index?patientId={patientId}");
        }

        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Update")]
        [HttpPost]
        public async Task<IActionResult> PatientIndexUpdateWidgetSave(AccountPatients patient)
        {
            string patientId = "";
            if (patient != null)
            {
                await _iAccountPatientsService.Update(patient);
                patientId = patient.Id;
            }
            return Redirect($"/Patient/Index?patientId={patientId}");
        }

        public async Task<IActionResult> Oral()
        {
            string patientId = Request.Query["patientId"].SingleOrDefault();
            Guid n;
            if (!Guid.TryParse(patientId, out n))
            {
                return RedirectToAction("Error404");
            }
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
        [AllowAnonymous]
        [HttpPost]
        public async Task<PartialViewResult> PatientSearchWidget(string patientName)
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);
            var patient = await _iAccountPatientsService.GetSearchList(patientName, _findAccount);

            //AccountPatients _patient = new AccountPatients();
            //_patient.NameSurname = "Ferhat Işık";
            //_patient.MobilePhone = "0000000000";
            //_patient.Id = "6ea1da47-0660-4caf-b0e1-20535fba4a99";
            //List<AccountPatients> patient = new List<AccountPatients>();
            //patient.Add(_patient);
            //AccountPatients _patient1 = new AccountPatients();
            //_patient1.NameSurname = "Mehmet Arslanoğlu";
            //_patient1.MobilePhone = "0000000000";
            //_patient1.Id = "936237a3-e3ab-4953-a47f-0000000000000";
            //patient.Add(_patient1);
            //AccountPatients _patient2 = new AccountPatients();
            //_patient2.NameSurname = "Uluç Eren";
            //_patient2.MobilePhone = "05301137203";
            //_patient2.Id = "936237a3-e3ab-4953-a47f-feb18f193535";
            //patient.Add(_patient2);
            return PartialView(patient.Data);
        }
        [HttpPost]
        public async Task<PartialViewResult> TreatmentWidget()
        {
            var result = await _iActionListService.GetList();
            ViewBag.ActionList = result.Data;
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string _findAccount = await findAccount(userId);
            var result1 = await _accountsTariffNamesService.GetByAccountsIdList(_findAccount);
            ViewBag.TariffNames = result1.ToList();

            return PartialView();
        }
        [HttpPost]
        public async Task<PartialViewResult> LeftTableWidget()
        {
            var result = await _iActionListService.GetList();
            ViewBag.ActionList = result.Data;
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string _findAccount = await findAccount(userId);
            var result1 = await _accountsTariffNamesService.GetByAccountsIdList(_findAccount);
            ViewBag.TariffNames = result1.ToList();

            return PartialView();
        }
        [HttpGet]
        public async Task<JsonResult> GetAccountTariffNamesCategories(long id)
        {
            List<AccountsTariffNamesCategories> accountsTariffNamesCategories = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(id);
            return Json(accountsTariffNamesCategories);
        }
        [HttpPost]
        public async Task<PartialViewResult> RightTableWidget(long categoryId)
        {
            List<AccountsTariffListsDto> costLists = (from i in await _accountsTariffListsService.GetListByCategories_Id(categoryId)
                                                      select new AccountsTariffListsDto
                                                      {
                                                          Id = i.Id,
                                                          CategoryName = _accountsTariffNamesCategoriesService.GetCategoryName(i.AccountsTariffNamesCategories_Id_Fk),
                                                          Treatment = i.Treatment,
                                                          Price = i.Price,
                                                          Vat = i.Vat,
                                                          PriceWithVat = i.PriceWithVat,
                                                          Cost = i.Cost,
                                                          Queue = i.Queue,
                                                          AccountsTariffNamesCategories_Id_Fk = i.AccountsTariffNamesCategories_Id_Fk
                                                      }).ToList();
            return PartialView(costLists);
        }
    }
}
