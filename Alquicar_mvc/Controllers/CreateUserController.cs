using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Alquicar_mvc.Controllers
{
    public class CreateUserController : Controller
    {
        CreateUserModel user = new CreateUserModel();
        // GET: CreateUser
        public ActionResult Index()
        {       
            return View();
        }

        // GET: CreateUser/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: CreateUser/Create
        public ActionResult Create()
        {
            ViewBag.permissions = user.QueryPermissions();
            ViewBag.roles = user.QueryRoles();
            return View();
        }

        // POST: CreateUser/Create
        [HttpPost]
        public ActionResult Create(CreateUserModel collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    user.RegisterUser(collection);
                    return RedirectToAction("Index");
                }
                else {
                    return View();
                }           
            }
            catch
            {
                return View();
            }
        }

        // GET: CreateUser/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CreateUser/Edit/5
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

        // GET: CreateUser/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CreateUser/Delete/5
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
