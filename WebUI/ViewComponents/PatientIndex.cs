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
                AccountPatients patient = new AccountPatients();
                patient.NameSurname = "";                
                return View(patient);
            }
            if (patientId != null)
            {
                AccountPatients patient = new AccountPatients();
                patient.NameSurname = "Ferhat Işık";                
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
