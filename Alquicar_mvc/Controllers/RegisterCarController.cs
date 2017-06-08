using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
            DataTable autos = carmodel.QueryCurrentCars();
            return View(autos);
        }

        // GET: RegisterCar/Details/5
        public ActionResult Details(int id)
        {
            DataTable detallecar = carmodel.QueryDetalleCar(id);
            return View(detallecar);
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
        public ActionResult Create(RegisterCarModels car,HttpPostedFileBase vehiculoimg)
        {
            try
            {
               
                if (vehiculoimg != null)
                {               
                    if (ModelState.IsValid)
                    {
                        string img = Path.GetFileName(vehiculoimg.FileName);
                        string ruta = "../images/vehiculos/" + img;
                        string carpeta = Path.Combine(Server.MapPath("~/images/vehiculos"), img);
                        if (carmodel.RegistrarCar(car, ruta))
                        {
                            vehiculoimg.SaveAs(carpeta);
                            Session["response"] = "Auto registrado correctamente";
                            return RedirectToAction("index", "Dashboard");
                        }
                        else {
                            ViewBag.response = "Error! algo salio mal";
                            return View();
                        }
                    }
                    else
                    {
                        return View();
                    }
                }
                else {
                    ViewBag.errorimg = "no has seleccionado una imagen";
                    return View();
                }
            }
            catch(Exception exc)
            {
                ViewBag.response = "Error! algo salio mal";
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
