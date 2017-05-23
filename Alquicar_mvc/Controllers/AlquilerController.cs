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
            ViewBag.vehiculos = alquilerM.QueryVehiculos();
            return View();
        }

        // POST: Alquiler/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
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
