using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
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
            DataTable alquileres = alquilerM.QueryAlquileres();
            return View(alquileres);

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


        // GET: Alquiler/Create
        public ActionResult Alquilar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Alquilar(AlquilerCarModel alquilerm)
        {
            try
            {
                if (alquilerM.RegisterAlquiler(alquilerm))
                {
                    Session["response"] = "alquiler registrado correctamente";
                    return RedirectToAction("Index", "Dashboard");
                }
                else {
                    ViewBag.response = "Error registrar el alquiler";
                    return View();
                }

                
            }
            catch
            {
                return View();
            }
        }

        // POST: Alquiler/Create
        [HttpPost]
        public ActionResult Create(string start_date, string final_date)
        {
            try 
            {
                ViewBag.Clientes = alquilerM.QueryClientes();
                ViewBag.idate = start_date;
                ViewBag.fdate = final_date;
                ViewBag.vehiculos = alquilerM.QueryVehiculos();

                return View("Alquilar");
            }
            catch
            {
                return View();
            }
        }

        // GET: Alquiler/devolucion
        public ActionResult devolucion()
        {
            return View();
        }

        [HttpPost]
        public ActionResult devolucion(string searchcar)
        {
            try
            {
                if (searchcar != null) {
                    ViewBag.querycar = alquilerM.QueryVehiculoAlquilado(searchcar);
                }
                
                return View("devolucion");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult recibido(string idcar)
        {
            try
            {
                string response = "";
                if (alquilerM.RegisterDevolucioncar(idcar))
                {
                    response = "Automovil actualizado con exito.";
                }
                else {
                    response = "Algo salio mal.";
                }
                Session["response"] = response;
                return RedirectToAction("index","Dashboard");
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


        //Json SeekCar
        // /Alquiler/getalquiler
        [HttpGet]
        public JsonResult getcar()
        {
            DataTable seekcardt = new DataTable();
            return Json(ConvertDatatableToJsonNative(seekcardt), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult getcar(string placa)
        {
            DataTable seekcardt = new DataTable();
            return Json(ConvertDatatableToJsonNative(seekcardt), JsonRequestBehavior.AllowGet);
        }

        public List<object> ConvertDatatableToJsonNative(DataTable dt)
        {

            var jsontxt = new List<object>();
            //for (int i = 0; i < dt.Rows.Count; i++) {
            //    for (int j = 0; j < dt.Columns.Count; j++) {
            //        jsontxt.Add(new { dt.Columns[j].ColumnName = dt.Rows[i].ToString(), dt.Columns[j].ColumnName = dt.Rows[i].ToString() });
            //    }
            //}

            foreach (DataRow row in dt.Rows)
            {
                jsontxt.Add(new { id = row["id"].ToString(), nombre = row["nombre"].ToString() });
            }

            return jsontxt;
        }
    }
}
