using Business.Repositories.AccountsTariffListsRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffNamesRepository;
using Business.Repositories.TDBCostListsRepository;
using Business.Repositories.TDBCostNameCategoriesRepository;
using Business.Repositories.TDBCostNamesRepository;
using Core.Utilities.Result.Abstract;
using DocumentFormat.OpenXml.InkML;
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
    
    public class SettingController : Controller
    {
		private readonly IAccountsTariffNamesService _accountsTariffNamesService;
        private readonly IAccountsTariffNamesCategoriesService _accountsTariffNamesCategoriesService;
        private readonly IAccountsTariffListsService _accountsTariffListsService;
        private readonly ITDBCostNamesService _iTDBCostNamesService;
        private readonly ITDBCostNameCategoriesService _iTDBCostNameCategoriesService;
        private readonly ITDBCostListsService _iTDBCostListsService;
        public SettingController(IAccountsTariffNamesService accountsTariffNamesService, IAccountsTariffNamesCategoriesService accountsTariffNamesCategoriesService, IAccountsTariffListsService accountsTariffListsService, ITDBCostNamesService tDBCostNamesService, ITDBCostNameCategoriesService tDBCostNameCategoriesService, ITDBCostListsService tDBCostListsService )
        {
			_accountsTariffNamesService = accountsTariffNamesService;
            _accountsTariffNamesCategoriesService = accountsTariffNamesCategoriesService;
            _accountsTariffListsService = accountsTariffListsService;
            _iTDBCostNamesService = tDBCostNamesService;
            _iTDBCostNameCategoriesService = tDBCostNameCategoriesService;
            _iTDBCostListsService = tDBCostListsService;
        }

        [Authorize(Roles = "Ayarlar Modülü » Tanımlamalar")]
        public async Task<IActionResult> Tariff()
        {
            //userId tespitinden sonra ana hesap tespit edilip ona göre işlem yapılmalı.Bu yazılan geçiçi
			string userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
            List<AccountsTariffNames> accountsTariffNames = await _accountsTariffNamesService.GetByAccountsIdList(userId);
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
                AccountsTariffNamesCategories _accountsTariffNamesCategories= new AccountsTariffNamesCategories();
                _accountsTariffNamesCategories.CategoryName = category.TDBCategoryName;
                _accountsTariffNamesCategories.AccountsTariffNames_Id_Fk = tariffNameId;
                await _accountsTariffNamesCategoriesService.Add(_accountsTariffNamesCategories);
                int _index = 1;
                foreach (TDBCostLists list in tDBCostLists)
                {
                    //long _listId= list.Id;
                    //add list
                    AccountsTariffLists _accountsTariffLists = new AccountsTariffLists();
                    _accountsTariffLists.Treatment=list.Treatment;
                    _accountsTariffLists.Price=list.Price;
                    _accountsTariffLists.Vat=list.Vat;
                    _accountsTariffLists.PriceWithVat=list.PriceWithVat;
                    _accountsTariffLists.Queue= _index;
                    _accountsTariffLists.Cost= 0;
                    _accountsTariffLists.AccountsTariffNamesCategories_Id_Fk= _accountsTariffNamesCategories.Id;
                    _index += 1;
                    await _accountsTariffListsService.Add(_accountsTariffLists);


                }
                //add category
                
            }
            return Json("İşlem Başarılı.");
        }

    }
}
