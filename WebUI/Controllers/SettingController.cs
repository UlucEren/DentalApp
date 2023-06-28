using Business.Repositories.AccountsDiagnozCategoriesRepository;
using Business.Repositories.AccountsDiagnozListsRepository;
using Business.Repositories.AccountsRepository;
using Business.Repositories.AccountsTariffListsRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffNamesRepository;
using Business.Repositories.SubAccountsRepository;
using Business.Repositories.TDBCostListsRepository;
using Business.Repositories.TDBCostNameCategoriesRepository;
using Business.Repositories.TDBCostNamesRepository;
using Core.Utilities.Result.Abstract;
using DocumentFormat.OpenXml.InkML;
using DocumentFormat.OpenXml.Office2010.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using Entities.Concrete;
using Entities.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Security.Claims;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
    [Authorize]
    public class SettingController : Controller
    {
        private readonly IAccountsTariffNamesService _accountsTariffNamesService;
        private readonly IAccountsTariffNamesCategoriesService _accountsTariffNamesCategoriesService;
        private readonly IAccountsTariffListsService _accountsTariffListsService;
        private readonly ITDBCostNamesService _iTDBCostNamesService;
        private readonly ITDBCostNameCategoriesService _iTDBCostNameCategoriesService;
        private readonly ITDBCostListsService _iTDBCostListsService;
        private readonly IAccountsService _iAccountsService;
        private readonly ISubAccountsService _iSubAccountsService;
        private readonly IAccountsDiagnozCategoriesService _iAccountsDiagnozCategoriesService;
        private readonly IAccountsDiagnozListsService _iAccountsDiagnozListsService;
        public SettingController(IAccountsTariffNamesService accountsTariffNamesService, IAccountsTariffNamesCategoriesService accountsTariffNamesCategoriesService, IAccountsTariffListsService accountsTariffListsService, ITDBCostNamesService tDBCostNamesService, ITDBCostNameCategoriesService tDBCostNameCategoriesService, ITDBCostListsService tDBCostListsService, IAccountsService iAccountsService, ISubAccountsService iSubAccountsService, IAccountsDiagnozCategoriesService accountsDiagnozCategoriesService, IAccountsDiagnozListsService accountsDiagnozListsService)
        {
            _accountsTariffNamesService = accountsTariffNamesService;
            _accountsTariffNamesCategoriesService = accountsTariffNamesCategoriesService;
            _accountsTariffListsService = accountsTariffListsService;
            _iTDBCostNamesService = tDBCostNamesService;
            _iTDBCostNameCategoriesService = tDBCostNameCategoriesService;
            _iTDBCostListsService = tDBCostListsService;
            _iAccountsService = iAccountsService;
            _iSubAccountsService = iSubAccountsService;
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

        [Authorize(Roles = "Ayarlar Modülü » Tanımlamalar")]
        public async Task<IActionResult> Tariff()
        {
            //userId tespitinden sonra ana hesap tespit edilip ona göre işlem yapılmalı.Bu yazılan geçiçi
            //ilk girdimi alt hesabı kontrol et varmı 
            //var fk ile ana hesaba yönlendir tariff çek
            //yok hesap ana hesap olabilir ana hesabı kontrol et
            //var tariff listesini çek
            //yok erişim engeli koy açma

            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);

            List<AccountsTariffNames> accountsTariffNames = await _accountsTariffNamesService.GetByAccountsIdList(_findAccount);
            return View(accountsTariffNames);
        }
        [HttpGet]
        public async Task<JsonResult> GetTariffNameCategories(long id)
        {
            List<AccountsTariffNamesCategories> accountsTariffNamesCategories = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(id);
            return Json(accountsTariffNamesCategories);
        }
        public async Task<PartialViewResult> GetCostListWidget(long id)
        {
            List<AccountsTariffListsDto> costLists = (from i in await _accountsTariffListsService.GetListByCategories_Id(id)
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
        public async Task<PartialViewResult> GetTdbListModalWidget()
        {
            List<TDBCostNames> tDBCostNames = await _iTDBCostNamesService.GetList();
            return PartialView(tDBCostNames);
        }
        [HttpPost]
        public async Task<JsonResult> TariffListToTDBList(long tariffNameId, long tdbId)
        {
            var accountsTariffNamesCategories = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(tariffNameId);
            foreach (AccountsTariffNamesCategories category in accountsTariffNamesCategories)
            {
                long _categoryId = category.Id;
                var accountsTariffLists = await _accountsTariffListsService.GetListByCategories_Id(_categoryId);
                foreach (AccountsTariffLists list in accountsTariffLists)
                {
                    //long _listId= list.Id;
                    //delete list
                    await _accountsTariffListsService.Delete(list);
                }
                //delete category
                await _accountsTariffNamesCategoriesService.Delete(category);
            }
            //add tdb category
            //add tdb list
            var tDBCostNameCategories = await _iTDBCostNameCategoriesService.GetByTDBCostNames_Id_Fk(tdbId);
            foreach (TDBCostNameCategories category in tDBCostNameCategories)
            {
                long _categoryId = category.Id;
                var tDBCostLists = await _iTDBCostListsService.GetListByCategories_Id(_categoryId);
                AccountsTariffNamesCategories _accountsTariffNamesCategories = new AccountsTariffNamesCategories();
                _accountsTariffNamesCategories.CategoryName = category.TDBCategoryName;
                _accountsTariffNamesCategories.AccountsTariffNames_Id_Fk = tariffNameId;
                await _accountsTariffNamesCategoriesService.Add(_accountsTariffNamesCategories);
                int _index = 1;
                foreach (TDBCostLists list in tDBCostLists)
                {
                    //long _listId= list.Id;
                    //add list
                    AccountsTariffLists _accountsTariffLists = new AccountsTariffLists();
                    _accountsTariffLists.Id = Guid.NewGuid().ToString(); ;
                    _accountsTariffLists.Treatment = list.Treatment;
                    _accountsTariffLists.Price = list.Price;
                    _accountsTariffLists.Vat = list.Vat;
                    _accountsTariffLists.PriceWithVat = list.PriceWithVat;
                    _accountsTariffLists.Queue = _index;
                    _accountsTariffLists.Cost = 0;
                    _accountsTariffLists.AccountsTariffNamesCategories_Id_Fk = _accountsTariffNamesCategories.Id;
                    _index += 1;
                    await _accountsTariffListsService.Add(_accountsTariffLists);


                }
                //add category

            }
            return Json("İşlem Başarılı.");
        }
        [HttpPost]
        public async Task<IActionResult> CreateTariff(string name, string transferredtariff, string ratio, string degisim_turu)
        {
            AccountsTariffNames accountsTariffNames = new AccountsTariffNames();
            accountsTariffNames.TariffName = name;
            accountsTariffNames.CreateDate = DateTime.Now;
            accountsTariffNames.Accounts_AspNetUsersIdFk_Fk = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            await _accountsTariffNamesService.Add(accountsTariffNames);

            long _accountTariffNamesId = Convert.ToInt64(transferredtariff);
            var oldcategory = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(_accountTariffNamesId);

            foreach (var item in oldcategory)
            {
                AccountsTariffNamesCategories newAccountsTariffNamesCategories = new AccountsTariffNamesCategories();
                newAccountsTariffNamesCategories.AccountsTariffNames_Id_Fk = accountsTariffNames.Id;//yeni names id
                newAccountsTariffNamesCategories.CategoryName = item.CategoryName;
                await _accountsTariffNamesCategoriesService.Add(newAccountsTariffNamesCategories);

                var oldlist = await _accountsTariffListsService.GetListByCategories_Id(item.Id);//kayıtlı list tespiti
                foreach (var item1 in oldlist)
                {
                    AccountsTariffLists newAccountsTariffLists = new AccountsTariffLists();
                    newAccountsTariffLists.Id = Guid.NewGuid().ToString();
                    newAccountsTariffLists.Treatment = item1.Treatment;
                    if (ratio != null) //oran yazıldığı zaman işlem yapılacak  //fiyatı yüzdelik olarak arttır azalt
                    {
                        if (degisim_turu == "1")
                        {
                            newAccountsTariffLists.Price = item1.Price + (item1.Price / 100 * Convert.ToDecimal(ratio));
                        }
                        else if (degisim_turu == "-1")
                        {
                            newAccountsTariffLists.Price = item1.Price - (item1.Price / 100 * Convert.ToDecimal(ratio));
                        }
                        newAccountsTariffLists.PriceWithVat = newAccountsTariffLists.Price + (newAccountsTariffLists.Price / 100 * Convert.ToDecimal(item1.Vat));

                    }
                    else //oran yazılmadığı zaman işlem yapılmayacak
                    {
                        newAccountsTariffLists.Price = item1.Price;
                        newAccountsTariffLists.PriceWithVat = item1.PriceWithVat;
                    }

                    newAccountsTariffLists.Vat = item1.Vat;

                    newAccountsTariffLists.Cost = item1.Cost;
                    newAccountsTariffLists.Queue = item1.Queue;
                    newAccountsTariffLists.AccountsTariffNamesCategories_Id_Fk = newAccountsTariffNamesCategories.Id;
                    await _accountsTariffListsService.Add(newAccountsTariffLists);
                }
            }


            return RedirectToAction("Tariff");
        }
        [HttpPost]
        public async Task<JsonResult> DelTariffName(int id)
        {
            AccountsTariffNames accountsTariffNames = new AccountsTariffNames();
            accountsTariffNames.Id = Convert.ToInt64(id);

            var category = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(id);

            foreach (var item in category)
            {
                AccountsTariffNamesCategories newAccountsTariffNamesCategories = new AccountsTariffNamesCategories();
                newAccountsTariffNamesCategories.Id = item.Id;

                var list = await _accountsTariffListsService.GetListByCategories_Id(item.Id);//kayıtlı list tespiti
                foreach (var item1 in list)
                {
                    AccountsTariffLists newAccountsTariffLists = new AccountsTariffLists();
                    newAccountsTariffLists.Id = item1.Id;
                    await _accountsTariffListsService.Delete(newAccountsTariffLists);
                }
                await _accountsTariffNamesCategoriesService.Delete(newAccountsTariffNamesCategories);
            }
            await _accountsTariffNamesService.Delete(accountsTariffNames);

            return Json("İşlem Başarılı.");
        }

        [HttpPost]
        public async Task<IActionResult> UpdateTariff(string name, long tariff_id, string ratio, string degisim_turu)
        {
            var tariffNames = await _accountsTariffNamesService.GetById(tariff_id);
            AccountsTariffNames accountsTariffNames = new AccountsTariffNames();
            accountsTariffNames.Id = tariffNames.Data.Id;
            accountsTariffNames.TariffName = name;
            accountsTariffNames.CreateDate = tariffNames.Data.CreateDate;
            accountsTariffNames.Accounts_AspNetUsersIdFk_Fk = tariffNames.Data.Accounts_AspNetUsersIdFk_Fk;
            await _accountsTariffNamesService.Update(accountsTariffNames);

            if (ratio != null) //oran yazıldığı zaman işlem yapılacak  //fiyatı yüzdelik olarak arttır azalt
            {
                var category = await _accountsTariffNamesCategoriesService.GetByAccountsTariffNames_Id_Fk(tariff_id);
                foreach (var item in category)
                {
                    var list = await _accountsTariffListsService.GetListByCategories_Id(item.Id);
                    foreach (var item1 in list)
                    {
                        AccountsTariffLists updateAccountsTariffLists = new AccountsTariffLists();
                        updateAccountsTariffLists.Id = item1.Id;
                        updateAccountsTariffLists.Treatment = item1.Treatment;
                        if (degisim_turu == "1")
                        {
                            updateAccountsTariffLists.Price = item1.Price + (item1.Price / 100 * Convert.ToDecimal(ratio));
                        }
                        else if (degisim_turu == "-1")
                        {
                            updateAccountsTariffLists.Price = item1.Price - (item1.Price / 100 * Convert.ToDecimal(ratio));
                        }
                        updateAccountsTariffLists.Vat = item1.Vat;
                        updateAccountsTariffLists.PriceWithVat = updateAccountsTariffLists.Price + (updateAccountsTariffLists.Price / 100 * Convert.ToDecimal(item1.Vat));
                        updateAccountsTariffLists.Cost = item1.Cost;
                        updateAccountsTariffLists.Queue = item1.Queue;
                        updateAccountsTariffLists.AccountsTariffNamesCategories_Id_Fk = item1.AccountsTariffNamesCategories_Id_Fk;

                        await _accountsTariffListsService.Update(updateAccountsTariffLists);
                    }
                }
            }
            return RedirectToAction("Tariff");
        }
        [HttpPost]
        public async Task<JsonResult> SetCostListQueue(string id, int queue)
        {
            var data = await _accountsTariffListsService.GetById(id);

            AccountsTariffLists updateAccountsTariffLists = new AccountsTariffLists();
            updateAccountsTariffLists.Id = data.Data.Id;
            updateAccountsTariffLists.Treatment = data.Data.Treatment;
            updateAccountsTariffLists.Price = data.Data.Price;
            updateAccountsTariffLists.Vat = data.Data.Vat;
            updateAccountsTariffLists.PriceWithVat = data.Data.PriceWithVat;
            updateAccountsTariffLists.Cost = data.Data.Cost;
            updateAccountsTariffLists.Queue = queue;
            updateAccountsTariffLists.AccountsTariffNamesCategories_Id_Fk = data.Data.AccountsTariffNamesCategories_Id_Fk;

            await _accountsTariffListsService.Update(updateAccountsTariffLists);

            return Json("İşlem Başarılı.");
        }
        [HttpPost]
        public async Task<JsonResult> SetTreatment(long categoryId, string treatmentName, string price, int vat, string cost)
        {
            var list = await _accountsTariffListsService.GetListByCategories_Id(categoryId);
            foreach (var item1 in list)
            {
                AccountsTariffLists updateAccountsTariffLists = new AccountsTariffLists();
                updateAccountsTariffLists.Id = item1.Id;
                updateAccountsTariffLists.Treatment = item1.Treatment;
                updateAccountsTariffLists.Price = item1.Price;
                updateAccountsTariffLists.Vat = item1.Vat;
                updateAccountsTariffLists.PriceWithVat = item1.Vat;
                updateAccountsTariffLists.Cost = item1.Cost;
                updateAccountsTariffLists.Queue = item1.Queue + 1;
                updateAccountsTariffLists.AccountsTariffNamesCategories_Id_Fk = item1.AccountsTariffNamesCategories_Id_Fk;

                await _accountsTariffListsService.Update(updateAccountsTariffLists);
            }
            AccountsTariffLists addAccountsTariffLists = new AccountsTariffLists();
            addAccountsTariffLists.Id = Guid.NewGuid().ToString();
            addAccountsTariffLists.Treatment = treatmentName;
            price = price.Replace('.', ',');
            addAccountsTariffLists.Price = Convert.ToDecimal(price);
            addAccountsTariffLists.Vat = vat;
            addAccountsTariffLists.PriceWithVat = addAccountsTariffLists.Price + (addAccountsTariffLists.Price / 100 * Convert.ToDecimal(vat));
            cost = cost.Replace(".", ",");
            addAccountsTariffLists.Cost = Convert.ToDecimal(cost);
            addAccountsTariffLists.Queue = 1;
            addAccountsTariffLists.AccountsTariffNamesCategories_Id_Fk = categoryId;

            await _accountsTariffListsService.Add(addAccountsTariffLists);

            return Json("İşlem Başarılı.");
        }
        [HttpPost]
        public async Task<JsonResult> DelTreatment(string Id)
        {
            var data = await _accountsTariffListsService.GetById(Id);
            await _accountsTariffListsService.Delete(data.Data);
            var list = await _accountsTariffListsService.GetListByCategories_Id(data.Data.AccountsTariffNamesCategories_Id_Fk);
            var orderList = list.OrderBy(x => x.Queue).ToList();

            int i = 1;
            foreach (var item1 in orderList)
            {
                AccountsTariffLists updateAccountsTariffLists = new AccountsTariffLists();
                updateAccountsTariffLists.Id = item1.Id;
                updateAccountsTariffLists.Treatment = item1.Treatment;
                updateAccountsTariffLists.Price = item1.Price;
                updateAccountsTariffLists.Vat = item1.Vat;
                updateAccountsTariffLists.PriceWithVat = item1.Vat;
                updateAccountsTariffLists.Cost = item1.Cost;
                updateAccountsTariffLists.Queue = i;
                updateAccountsTariffLists.AccountsTariffNamesCategories_Id_Fk = item1.AccountsTariffNamesCategories_Id_Fk;

                await _accountsTariffListsService.Update(updateAccountsTariffLists);
                i = i + 1;
            }

            return Json("İşlem Başarılı.");
        }
        [HttpPost]
        public async Task<JsonResult> DelAllTreatment(long Id)
        {
            var list = await _accountsTariffListsService.GetListByCategories_Id(Id);
            foreach (var item in list)
            {
                AccountsTariffLists delAccountsTariffLists = new AccountsTariffLists();
                delAccountsTariffLists.Id = item.Id;
                await _accountsTariffListsService.Delete(delAccountsTariffLists);
            }

            return Json("İşlem Başarılı.");
        }
        [HttpPost]
        public async Task<JsonResult> UpdateTreatment(string treatmentId, string treatmentName, string price, int vat, string cost)
        {
            var data = await _accountsTariffListsService.GetById(treatmentId);
            data.Data.Treatment = treatmentName;
            price = price.Replace('.', ',');
            data.Data.Price = Convert.ToDecimal(price);
            data.Data.Vat = vat;
            data.Data.PriceWithVat = data.Data.Price + (data.Data.Price / 100 * Convert.ToDecimal(vat));
            cost = cost.Replace('.', ',');
            data.Data.Cost = Convert.ToDecimal(cost);
            await _accountsTariffListsService.Update(data.Data);
            return Json("İşlem Başarılı.");
        }
        [Authorize(Roles = "Ayarlar Modülü » Tanımlamalar")]
        public async Task<IActionResult> Diagnosis()
        {
            //userId tespitinden sonra ana hesap tespit edilip ona göre işlem yapılmalı.Bu yazılan geçiçi
            //ilk girdimi alt hesabı kontrol et varmı 
            //var fk ile ana hesaba yönlendir tariff çek
            //yok hesap ana hesap olabilir ana hesabı kontrol et
            //var tariff listesini çek
            //yok erişim engeli koy açma

            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            string _findAccount = await findAccount(userId);

            var accountsDiagnozCategories = await _iAccountsDiagnozCategoriesService.GetByAccountsIdList(_findAccount);
            return View(accountsDiagnozCategories.Data);
        }
        public async Task<PartialViewResult> GetDiagnozListWidget(long id)
        {
            List<AccountsDiagnozListsDto> diagnozLists = (from i in await _iAccountsDiagnozListsService.GetListByCategories_Id(id)
                                                      select new AccountsDiagnozListsDto
                                                      {
                                                          Id = i.Id,
                                                          CategoryName = _iAccountsDiagnozCategoriesService.GetCategoryName(i.AccountsDiagnozCategories_Id_Fk),
                                                          Name = i.Name,                                                          
                                                          Queue = i.Queue,
                                                          AccountsDiagnozCategories_Id_Fk = i.AccountsDiagnozCategories_Id_Fk
                                                      }).ToList();
            return PartialView(diagnozLists);
        }

    }
}
