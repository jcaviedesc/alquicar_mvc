using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Alquicar_mvc.Controllers
{
    public class ProveedorController : Controller
    {
        ProveedorModel proveedor = new ProveedorModel();
        DatosBasicosModel datosbs = new DatosBasicosModel();
        // GET: Proveedor
        public ActionResult Index()
        {
            return View();
        }

        // GET: Proveedor/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Proveedor/Create
        public ActionResult Create()
        {
            ViewBag.Genero = datosbs.QueryGenero();
            ViewBag.TipoPer = datosbs.QueryTiposPer();
            return View();
        }

        // POST: Proveedor/Create
        [HttpPost]
        public ActionResult Create(ProveedorModel pro)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    proveedor.registrarProveedor(pro);
                    return RedirectToAction("index", "Dashboard");
                }
                else {
                    return RedirectToAction("Create");
                }             
            }
            catch
            {
                return View();
            }
        }

        // GET: Proveedor/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Proveedor/Edit/5
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

        // GET: Proveedor/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Proveedor/Delete/5
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
