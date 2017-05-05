using ArquitecturaMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ArquitecturaMVC.Controllers
{
    public class SearchCarController : Controller
    {
        // GET: SearchCar
        public ActionResult Index()
        {
            return View();
        }

        // GET: SearchCar/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SearchCar/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SearchCar/Create
        [HttpPost]
        public ActionResult Create(SearchCarModel car)
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

        // GET: SearchCar/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SearchCar/Edit/5
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

        // GET: SearchCar/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SearchCar/Delete/5
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
