using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Alquicar_mvc.Controllers
{
    public class AlquilerController : Controller
    {
        AlquilerCarModel alquilerM = new AlquilerCarModel();
        // GET: Alquiler
        public ActionResult Index()
        {
            return View();

        }

        // GET: Alquiler/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Alquiler/Create
        public ActionResult Create()
        {
            ViewBag.idate = "2017-05-22";
            ViewBag.fdate = "2018-05-23";
            return View();
        }

        [HttpPost]
        public ActionResult alquilar(AlquilerCarModel alquilerm)
        {
            try
            {
                alquilerM.RegisterAlquiler(alquilerm);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // POST: Alquiler/Create
        [HttpPost]
        public ActionResult Create(string start_date, string final_date, AlquilerCarModel alquilerm)
        {
            try 
            {
                ViewBag.idate = start_date;
                ViewBag.fdate = final_date;
                ViewBag.vehiculos = alquilerM.QueryVehiculos();

                return View();
            }
            catch
            {
                return View();
            }
        }

        // GET: Alquiler/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Alquiler/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Alquiler/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Alquiler/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
