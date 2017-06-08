using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Alquicar_mvc.Controllers
{
    public class ClienteController : Controller
    {
        ClienteModels cli_model = new ClienteModels();
        DatosBasicosModel datosbs = new DatosBasicosModel();
        // GET: Cliente
        public ActionResult Index()
        {
            DataTable datos_cli = cli_model.QueryUser();
            return View(datos_cli);
        }

        // GET: Cliente/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Cliente/Create
        public ActionResult Create()
        {
            ViewBag.Genero = datosbs.QueryGenero();
            ViewBag.TipoPer = datosbs.QueryTiposPer();
            return View();
        }

        // POST: Cliente/Create
        [HttpPost]
        public ActionResult Create(ClienteModels collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (cli_model.registrarUsur(collection))
                    {
                        Session["response"] = "Cliente registrado";
                        return RedirectToAction("index", "Dashboard");
                    }
                    else {
                        ViewBag.response = "Error! algo va mal";
                        return View();
                    }
                   
                }else
                {
                    return View();
                }
                

            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Cliente/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, ClienteModels collection)
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

        // GET: Cliente/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Cliente/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, ClienteModels collection)
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
