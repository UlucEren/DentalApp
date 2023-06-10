using Business.Repositories.AccountsTariffListsRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffNamesRepository;
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
using Microsoft.CodeAnalysis.VisualBasic.Syntax;
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
            //ilk girdimi alt hesabı kontrol et varmı 
            //var fk ile ana hesaba yönlendir tariff çek
            //yok hesap ana hesap olabilir ana hesabı kontrol et
            //var tariff listesini çek
            //yok erişim engeli koy açma
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
                    _accountsTariffLists.Id = Guid.NewGuid().ToString(); ;
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
        [HttpPost]
        public async Task<IActionResult> CreateTariff(string name,string transferredtariff,string ratio,string degisim_turu)
        {
            AccountsTariffNames accountsTariffNames=new AccountsTariffNames();
            accountsTariffNames.TariffName=name;
            accountsTariffNames.CreateDate= DateTime.Now;
			accountsTariffNames.Accounts_AspNetUsersIdFk_Fk= HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value!;
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
                    newAccountsTariffLists.Id= Guid.NewGuid().ToString();
                    newAccountsTariffLists.Treatment = item1.Treatment;
                    if (ratio!=null) //oran yazıldığı zaman işlem yapılacak  //fiyatı yüzdelik olarak arttır azalt
					{
                        if (degisim_turu=="1")
                        {
							newAccountsTariffLists.Price = item1.Price + (item1.Price/100*Convert.ToDecimal(ratio));
						}
                        else if (degisim_turu=="-1")
                        {
							newAccountsTariffLists.Price = item1.Price - (item1.Price / 100 * Convert.ToDecimal(ratio));
						}
						newAccountsTariffLists.PriceWithVat = newAccountsTariffLists.Price + (newAccountsTariffLists.Price/100*Convert.ToDecimal(item1.Vat));

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
                        updateAccountsTariffLists.Vat=item1.Vat;
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
    }
}
