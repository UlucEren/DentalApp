﻿using Business.Repositories.AccountPatientsRepository;
using Business.Repositories.AccountsDiagnozCategoriesRepository;
using Business.Repositories.AccountsDiagnozListsRepository;
using Business.Repositories.AccountsRepository;
using Business.Repositories.AccountsTariffListsRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffNamesRepository;
using Business.Repositories.AccountTreatmentsRepository;
using Business.Repositories.ActionListRepository;
using Business.Repositories.AspNetUsersRepository;
using Business.Repositories.SubAccountsRepository;
using Business.Repositories.UserRepository;
using Castle.Components.DictionaryAdapter.Xml;
using Core.Utilities.Result.Concrete;
using DataAccess.Context.EntityFramework;
using DocumentFormat.OpenXml.Office2010.Excel;
using Entities.Concrete;
using Entities.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
        private readonly IAccountTreatmentsService _iAccountTreatmentsService;
        private readonly IAspNetUsersService _iAspNetUsersService;
        private readonly IAccountsDiagnozCategoriesService _iAccountsDiagnozCategoriesService;
        private readonly IAccountsDiagnozListsService _iAccountsDiagnozListsService;

        public PatientController(IAccountPatientsService iAccountPatientsService, IAccountsService iAccountsService, ISubAccountsService iSubAccountsService, IActionListsService iActionListService, IAccountsTariffNamesService iAccountsTariffNamesService, IAccountsTariffNamesCategoriesService accountsTariffNamesCategoriesService, IAccountsTariffListsService accountsTariffListsService, IAccountTreatmentsService accountTreatmentsService, IAspNetUsersService aspNetUsersService, IAccountsDiagnozCategoriesService accountsDiagnozCategoriesService, IAccountsDiagnozListsService accountsDiagnozListsService)
        {
            _iAccountPatientsService = iAccountPatientsService;
            _iAccountsService = iAccountsService;
            _iSubAccountsService = iSubAccountsService;
            _iActionListService = iActionListService;
            _accountsTariffNamesService = iAccountsTariffNamesService;
            _accountsTariffNamesCategoriesService = accountsTariffNamesCategoriesService;
            _accountsTariffListsService = accountsTariffListsService;
            _iAccountTreatmentsService = accountTreatmentsService;
            _iAspNetUsersService = aspNetUsersService;
            _iAccountsDiagnozCategoriesService = accountsDiagnozCategoriesService;
            _iAccountsDiagnozListsService = accountsDiagnozListsService;
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
        public async Task<PartialViewResult> TreatmentWidget(string patientId)
        {
            var result = await _iActionListService.GetList();
            ViewBag.ActionList = result.Data;

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string _findAccount = await findAccount(userId);
            var result1 = await _accountsTariffNamesService.GetByAccountsIdList(_findAccount);
            ViewBag.TariffNames = result1.ToList();

            List<SelectListItem> doctor = new List<SelectListItem>();
            doctor.Add(new SelectListItem { Value = _findAccount, Text = _iAspNetUsersService.GetUserName(_findAccount) });
            //subaccountlarda doktorları tespit edilip eklenecek
            ViewBag.Doctor = doctor;

            var patient = await _iAccountPatientsService.GetByPatient(patientId, _findAccount);
            ViewBag.PatientId = patientId;
            ViewBag.PatientName = patient.Data.NameSurname;
            return PartialView();
        }
        [HttpPost]
        public async Task<PartialViewResult> LeftTableWidget(int actionListId, string patientId)
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);
            if (_findAccount == "0")
            {
                return PartialView();
            }
            var result = await _iAccountTreatmentsService.GetTreatmentListByActionId(_findAccount, actionListId, patientId);
            decimal totalPrice = 0;
            foreach (var item in result.Data)
            {
                totalPrice = totalPrice + item.PriceWithVat;
            }
            ViewBag.TotalPrice = totalPrice;
            List<AccountTreatmentsDto> treatment = (from i in _iAccountTreatmentsService.GetTreatmentListByActionId(_findAccount, actionListId, patientId).Result.Data
                                                    select new AccountTreatmentsDto
                                                    {
                                                        Id = i.Id,
                                                        Treatment = i.Treatment,
                                                        Price = i.Price,
                                                        Vat = i.Vat,
                                                        PriceWithVat = i.PriceWithVat,
                                                        Cost = i.Cost,
                                                        Date = i.Date,
                                                        Teeth = i.Teet,
                                                        Accounts_AspNetUsers_Id_Fk = i.Accounts_AspNetUsers_Id_Fk,
                                                        AccountPatients_Id_Fk = i.AccountPatients_Id_Fk,
                                                        AccountsTariffLists_Id_Fk = i.AccountsTariffLists_Id_Fk,
                                                        ActionLists_Id_Fk = i.ActionLists_Id_Fk,
                                                        Doctor_SubAccounts_AspNetUsers_Id_Fk = i.Doctor_SubAccounts_AspNetUsers_Id_Fk,
                                                        Doctor_SubAccounts_AspNetUsers_Id_Fk_Name = _iAspNetUsersService.GetUserName(i.Doctor_SubAccounts_AspNetUsers_Id_Fk),
                                                        Comment = i.Comment

                                                    }).OrderByDescending(x => x.Date).ToList();


            return PartialView(treatment);
        }
        [HttpGet]
        public async Task<JsonResult> GetAccountTariffNamesCategories(long id)
        {
            List<AccountsTariffNamesCategories> accountsTariffNamesCategories = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(id);
            return Json(accountsTariffNamesCategories);
        }
        [HttpPost]
        public async Task<PartialViewResult> RightTableWidget(long categoryId, string patientId)
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
                                                      }).OrderBy(x => x.Queue).ToList();
            ViewBag.PatientId = patientId;
            return PartialView(costLists);
        }
        [HttpPost]
        public async Task<JsonResult> TreatmentSaveDb(string listId, string teet, string actionListId, string patientId, string doctorId)
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);
            if (actionListId == "1")
            {
                var diagnoz = await _iAccountsDiagnozListsService.GetById(listId);
                AccountsTreatments accountTreatments = new AccountsTreatments();
                accountTreatments.Id = Guid.NewGuid().ToString();
                accountTreatments.Treatment = diagnoz.Data.Name;
                accountTreatments.Date = DateTime.Now;
                accountTreatments.Teet = teet;
                accountTreatments.Accounts_AspNetUsers_Id_Fk = _findAccount;
                accountTreatments.AccountPatients_Id_Fk = patientId;
                accountTreatments.AccountsDiagnozLists_Id_Fk = listId;
                accountTreatments.ActionLists_Id_Fk = Convert.ToInt32(actionListId);
                accountTreatments.Doctor_SubAccounts_AspNetUsers_Id_Fk = doctorId;

                await _iAccountTreatmentsService.Add(accountTreatments);

                return Json(new { TreatmentId = accountTreatments.Id, CreateDate = accountTreatments.Date });
            }
            else
            {
                var tariff = await _accountsTariffListsService.GetById(listId);
                AccountsTreatments accountTreatments = new AccountsTreatments();
                accountTreatments.Id = Guid.NewGuid().ToString();
                accountTreatments.Treatment = tariff.Data.Treatment;
                accountTreatments.Price = tariff.Data.Price;
                accountTreatments.Vat = tariff.Data.Vat;
                accountTreatments.PriceWithVat = tariff.Data.PriceWithVat;
                accountTreatments.Cost = tariff.Data.Cost;
                accountTreatments.Date = DateTime.Now;
                accountTreatments.Teet = teet;
                accountTreatments.Accounts_AspNetUsers_Id_Fk = _findAccount;
                accountTreatments.AccountPatients_Id_Fk = patientId;
                accountTreatments.AccountsTariffLists_Id_Fk = listId;
                accountTreatments.ActionLists_Id_Fk = Convert.ToInt32(actionListId);
                accountTreatments.Doctor_SubAccounts_AspNetUsers_Id_Fk = doctorId;

                await _iAccountTreatmentsService.Add(accountTreatments);

                return Json(new { TreatmentId = accountTreatments.Id, CreateDate = accountTreatments.Date });
            }

        }
        [HttpPost]
        public async Task<JsonResult> GetAccountDiagnozCategories()
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);
            var accountsDiagnozCategories = await _iAccountsDiagnozCategoriesService.GetByAccountsIdList(_findAccount);
            return Json(accountsDiagnozCategories.Data);
        }
        [HttpPost]
        public async Task<PartialViewResult> RightTableDiagnozWidget(long categoryId, string patientId)
        {
            List<AccountsTariffListsDto> costLists = (from i in await _iAccountsDiagnozListsService.GetListByCategories_Id(categoryId)
                                                      select new AccountsTariffListsDto
                                                      {
                                                          Id = i.Id,
                                                          CategoryName = _iAccountsDiagnozCategoriesService.GetCategoryName(i.AccountsDiagnozCategories_Id_Fk),
                                                          Treatment = i.Name,
                                                          Queue = i.Queue,
                                                          AccountsTariffNamesCategories_Id_Fk = i.AccountsDiagnozCategories_Id_Fk
                                                      }).OrderBy(x => x.Queue).ToList();
            ViewBag.PatientId = patientId;
            return PartialView(costLists);
        }
        [HttpPost]
        public async Task<JsonResult> DelAccountsTreatments(string Id)
        {
            AccountsTreatments accountsTreatments = new AccountsTreatments();
            accountsTreatments.Id = Id;
            try
            {
                await _iAccountTreatmentsService.Delete(accountsTreatments);
            }
            catch (Exception)
            {

                throw;
            }


            return Json("İşlem Başarılı.");
        }

        [HttpPost]
        public async Task<JsonResult> UpdateAccountsTreatments(string treatmentId, string price, string cost, DateTime dateTime, string doctorId, string comment)
        {
            var data = await _iAccountTreatmentsService.GetById(treatmentId);
            price = price.Replace('.', ',');
            data.Data.PriceWithVat = Convert.ToDecimal(price);

            decimal kdvOrani = Convert.ToDecimal(data.Data.Vat); // KDV oranı (%10)
            decimal kdvliFiyat = data.Data.PriceWithVat; // KDV'li fiyat
            decimal kdvMiktari = kdvliFiyat / (1 + kdvOrani);
            decimal kdvSizFiyat = kdvliFiyat - kdvMiktari;
            data.Data.Price = kdvSizFiyat;

            cost = cost.Replace('.', ',');
            data.Data.Cost = Convert.ToDecimal(cost);
            data.Data.Date = dateTime;
            data.Data.Doctor_SubAccounts_AspNetUsers_Id_Fk = doctorId;
            data.Data.Comment = comment;
            try
            {
                await _iAccountTreatmentsService.Update(data.Data);
            }
            catch (Exception)
            {

                throw;
            }

            return Json("İşlem Başarılı.");
        }
        [HttpPost]
        public async Task<JsonResult> CopyAccountsTreatments(string patientId, int actionList)
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);

            var accountTreatments = await _iAccountTreatmentsService.GetTreatmentListByActionId(_findAccount, actionList, patientId);
            foreach (var item in accountTreatments.Data)
            {
                AccountsTreatments _accountsTreatments = new AccountsTreatments();
                _accountsTreatments.Id = Guid.NewGuid().ToString();
                _accountsTreatments.Treatment = item.Treatment;
                _accountsTreatments.Price = item.Price;
                _accountsTreatments.Vat = item.Vat;
                _accountsTreatments.PriceWithVat = item.PriceWithVat;
                _accountsTreatments.Cost = item.Cost;
                _accountsTreatments.Date = DateTime.Now;
                _accountsTreatments.Teet = item.Teet;
                _accountsTreatments.Accounts_AspNetUsers_Id_Fk = item.Accounts_AspNetUsers_Id_Fk;
                _accountsTreatments.AccountPatients_Id_Fk = item.AccountPatients_Id_Fk;
                _accountsTreatments.AccountsTariffLists_Id_Fk = item.AccountsTariffLists_Id_Fk;
                _accountsTreatments.AccountsDiagnozLists_Id_Fk = null;
                _accountsTreatments.ActionLists_Id_Fk = 2;
                _accountsTreatments.Doctor_SubAccounts_AspNetUsers_Id_Fk = item.Doctor_SubAccounts_AspNetUsers_Id_Fk;
                _accountsTreatments.Comment = item.Comment;
                await _iAccountTreatmentsService.Add(_accountsTreatments);

            }
            return Json("İşlem Başarılı.");
        }
    }
}
