using Business.Repositories.AccountsTariffListsRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffNamesRepository;
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
        public SettingController(IAccountsTariffNamesService accountsTariffNamesService, IAccountsTariffNamesCategoriesService accountsTariffNamesCategoriesService, IAccountsTariffListsService accountsTariffListsService, ITDBCostNamesService tDBCostNamesService)
        {
			_accountsTariffNamesService = accountsTariffNamesService;
            _accountsTariffNamesCategoriesService = accountsTariffNamesCategoriesService;
            _accountsTariffListsService = accountsTariffListsService;
            _iTDBCostNamesService = tDBCostNamesService;
        }

        [Authorize(Roles = "Ayarlar Modülü » Tanımlamalar")]
        public async Task<IActionResult> Tariff()
        {

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
        
    }
}
