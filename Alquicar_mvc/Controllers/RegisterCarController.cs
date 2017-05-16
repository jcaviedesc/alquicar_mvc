using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Alquicar_mvc.Controllers
{
    public class RegisterCarController : Controller
    {
        RegisterCarModels carmodel = new RegisterCarModels();
        ClienteModels cliente = new ClienteModels();
        // GET: RegisterCar
        public ActionResult Index()
        {
            return View();
        }

        // GET: RegisterCar/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: RegisterCar/Create
        public ActionResult Create()
        {
            ViewBag.proveedores = carmodel.QueryProveedor();
            ViewBag.vehiculos = carmodel.QueryTipoVehiculo();
            ViewBag.direcciones = carmodel.QueryDireccion();
            ViewBag.marcas = carmodel.QueryMarcas();
            ViewBag.transmicion = carmodel.QueryTransmition();
            return View();
        }

        // POST: RegisterCar/Create
        [HttpPost]
        public ActionResult Create(RegisterCarModels car)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    carmodel.RegistrarCar(car);
                    return RedirectToAction("Index", "Dashboard");
                }
                else
                {
                    return View();
                }

            }
            catch
            {
                return View();
            }
        }
       
        // GET: RegisterCar/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: RegisterCar/Edit/5
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

        // GET: RegisterCar/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: RegisterCar/Delete/5
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
