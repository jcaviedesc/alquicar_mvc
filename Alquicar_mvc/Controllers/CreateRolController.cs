using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Alquicar_mvc.Controllers
{
    public class CreateRolController : Controller
    {
        CreateRolModel rolmod = new CreateRolModel();
        // GET: CreateRol
        public ActionResult Index()
        {
            DataTable roles = rolmod.QueryRolesCurrent();
            return View(roles);
        }

        // GET: CreateRol/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: CreateRol/Create
        public ActionResult Create()
        {
            ViewBag.permissions = rolmod.QueryPermissionRol();
            return View();
        }

        // POST: CreateRol/Create
        [HttpPost]
        public ActionResult Create(CreateRolModel collectionRol)
        {
            try
            {
                rolmod.RegisterRol(collectionRol);
                return RedirectToAction("Index","Dashboard");
            }
            catch
            {
                return View();
            }
        }

        // GET: CreateRol/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CreateRol/Edit/5
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

        // GET: CreateRol/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CreateRol/Delete/5
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
