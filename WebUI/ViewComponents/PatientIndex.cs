using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace WebUI.ViewComponents
{
    public class PatientIndex:ViewComponent
    {
        public IViewComponentResult Invoke(string patientId,string action)
        {
            
            if (action == "New")
            {
                Patient patient = new Patient();
                patient.FirstName = "";
                patient.LastName = "";
                return View(patient);
            }
            if (patientId != null)
            {
                Patient patient = new Patient();
                patient.FirstName = "Ferhat";
                patient.LastName = "Işık";
                ViewBag.PatientIndexUpdateWidgetSave = "/Patient/PatientIndexUpdateWidgetSave";
                return View(patient);
            }
            else
            {
                return View();
            }
            
        }
    }
}
