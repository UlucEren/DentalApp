using Entities.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Data;
using System.Security.Claims;
using WebUI.Models.AppIdentityDb;

namespace WebUI.Controllers
{
    [Authorize(Roles = "Hasta Modülü.Read")]
    public class PatientController : Controller
    {
        public IActionResult Index()
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
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            }
            else
            {
                //current autokention id al
                //db den hasta kaydı varmı kontrolunu yap
                //hasta bilgisi yoksa model boş olsun ki yeni kayıt yapılsın
                // db den en son giriş yapılan hastanın bilgilerini getir.
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                Patient patient = new Patient();
                patient.FirstName = "Ferhat";
                patient.LastName = "Işık";
                patientId = "6b25f39f-c6ca-4b63-9539-eb693b65e38c";
                ViewBag.PatientId = patientId;
                return View(patient);
            }


            return View();
        }
        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Read")]
        public PartialViewResult PatientIndexReadWidget(string patientId)
        {
            if (patientId != null)
            {
                Patient patient = new Patient();
                patient.FirstName = "Ferhat";
                patient.LastName = "Işık";
                ViewBag.PatientIndexUpdateWidgetSave = "/Patient/PatientIndexUpdateWidgetSave";
                return PartialView(patient);
            }
            else
            {
                return PartialView();
            }

        }
        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Create")]
        public PartialViewResult PatientIndexNewWidget()
        {
            Patient patient = new Patient();
            patient.FirstName = "";
            patient.LastName = "";
            ViewBag.PatientIndexNewWidgetSave = "/Patient/PatientIndexNewWidgetSave";
            return PartialView(patient);

        }
        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Create")]
        [HttpPost]
        public JsonResult PatientIndexNewWidgetSave(Patient patient)
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

        [Authorize(Roles = "Hasta Modülü » Hasta Ekranı.Update")]
        [HttpPost]
        public JsonResult PatientIndexUpdateWidgetSave(Patient patient)
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
