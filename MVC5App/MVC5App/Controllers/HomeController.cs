using MVC5App.EF;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC5App.Controllers
{
    public class HomeController : Controller
    {
        private readonly Model1 db;
        public HomeController()
        {
            db = new Model1();
        }
        public ActionResult Index()
        {
            Patient _Patient = new Patient();
            loadMasterData(); 
            return View(_Patient);
        }
        [HttpPost]
        public ActionResult Index(Patient patientModal)
        {
            try
            {
                Patient _Patient = new Patient();
                if (string.IsNullOrEmpty(patientModal.Fname))//These will write the error message for server side validation
                {
                    ModelState.AddModelError("Name", "Fname is required");
                }
                if (string.IsNullOrEmpty(patientModal.Lname))//These will write the error message for server side validation
                {
                    ModelState.AddModelError("Name", "Lname is required");
                }
                if (ModelState.IsValid)
                {
                    if (!string.IsNullOrWhiteSpace(patientModal.Fname))
                    {
                        if (!string.IsNullOrWhiteSpace(patientModal.ComplaintJson))
                        {
                            List<PatientComplaint> _patientComplaint = new List<PatientComplaint>();
                            foreach (var item in patientModal.ComplaintJson.Split(','))
                            {
                                _patientComplaint.Add(new PatientComplaint { Complaint_Id = Convert.ToInt16(item) });
                            }
                            patientModal.PatientComplaints = _patientComplaint;
                            //Note: In above code step we added the entity of PatientComplaints to patient
                        }
                        db.Patients.Add(patientModal);

                        //The final transaction
                        db.SaveChanges();//This method is responsible for final commit changes
                    }
                    TempData["Success"] = "Success";
                    ModelState.Clear();
                }

                loadMasterData();
                return View(_Patient);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        private List<SelectListItem> getDepartment() {
            List<SelectListItem> listDepartment = (from @item in db.Departments
                                                   select new SelectListItem
                                                   {
                                                       Text= @item.Name,
                                                       Value= @item.Department_Id.ToString()
                                                   }).ToList(); 
            return listDepartment;
        }

        private List<SelectListItem> getDoctors()
        {
            List<SelectListItem> listDoctors = (from @item in db.Doctors
                                                select new SelectListItem
                                                {
                                                    Text = @item.Name,
                                                    Value = @item.Doctor_Id.ToString()
                                                }).ToList(); 
            return listDoctors;
        }

        private List<SelectListItem> getComplains()
        {
            List<SelectListItem> listComplains = (from @item in db.Complaints
                                                  select new SelectListItem
                                                  {
                                                      Text = @item.Name,
                                                      Value = @item.Complaint_Id.ToString()
                                                  }).ToList();
            return listComplains;
        }
        private void loadMasterData()
        { 
            ViewData["DepartmentList"] = getDepartment();
            ViewData["DoctorList"] = getDoctors();
            ViewData["ComplainList"] = getComplains();
        }
    }
}