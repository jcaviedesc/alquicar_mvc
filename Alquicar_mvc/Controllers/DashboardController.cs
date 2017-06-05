using Alquicar_mvc.Models;

using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace Alquicar_mvc.Controllers
{
    public class DashboardController : Controller
    {
        RegisterCarModels carmodel = new RegisterCarModels();
        ClienteModels cliente = new ClienteModels();
        // GET: Dashboard
        public ActionResult Index()
        {
            return View();
        }
        //GET: tipos autos
        public ActionResult newcar()
        {
            return View();
        }
       
        //Post para salir de toda la app
        [HttpPost]
        public ActionResult salirboard() {
            Session.RemoveAll();
            return RedirectToAction("Index", "Home");
        }

        // GET: Dashboard/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Dashboard/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dashboard/Create
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

        // GET: Dashboard/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Dashboard/Edit/5
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

        // GET: Dashboard/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Dashboard/Delete/5
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

        //intentos de serializar un datatable a Json sin que salga con el caracter  => \
        [HttpGet]
        //Json method for types transmition
        public JsonResult getTrasmicion()
        {
            DataTable Query = carmodel.QueryTransmition();
            return Json(ConvertDatatableToJsonNative(Query), JsonRequestBehavior.AllowGet);
        }
        //Json marcas
        // /Dashboard/getmarcas
        [HttpGet]
        public JsonResult getmarcas()
        {
            DataTable marcasdt = carmodel.QueryMarcas();
            return Json(ConvertDatatableToJsonNative(marcasdt), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult getdireccion()
        {
            DataTable dirdt = carmodel.QueryDireccion();
            List<object> jsondt = ConvertDatatableToJsonNative(dirdt);
            return Json(jsondt, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult tipovehiculo()
        {
            DataTable dttipovh = carmodel.QueryTipoVehiculo();
            return Json(ConvertDatatableToJsonNative(dttipovh), JsonRequestBehavior.AllowGet);
        }
        
        public ActionResult marcasjson()
        {
            DataTable marcasdt = carmodel.QueryMarcas();
            return Json(marcasdt, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }
        public JsonResult marcasjsonresult()
        {
            DataTable marcasdt = carmodel.QueryMarcas();
            return Json(DataTableToJSONwithJsonConvert(marcasdt), "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        // json result
        public ActionResult Transmiciones()
        {
            DataTable Query = carmodel.QueryTransmition();
            return Json(Query, JsonRequestBehavior.AllowGet);
        }

        //native
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


        public static string ConvertIntoJsonwithStringBuilder(DataTable dt)
        {
            //[{"id":"1","name":}]
            var jsonString = new StringBuilder();
            if (dt.Rows.Count > 0)
            {
                jsonString.Append("[");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    jsonString.Append("{");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        jsonString.Append('"' + dt.Columns[j].ColumnName.ToString() + '"' + ":" + '"'
                            + dt.Rows[i][j].ToString() + (j < dt.Columns.Count - 1 ? "\"," : "\""));
                    }
                    jsonString.Append(i < dt.Rows.Count - 1 ? "}," : "}");
                }
                return jsonString.Append("]").ToString();
            }
            else
            {
                return "[]";
            }
        }

        public string DataTableToJSONwithJsonConvert(DataTable table)
        {
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }

        public string DataTableToJSONWithJavaScriptSerializer(DataTable table)
        {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
            Dictionary<string, object> childRow;
            foreach (DataRow row in table.Rows)
            {
                childRow = new Dictionary<string, object>();
                foreach (DataColumn col in table.Columns)
                {
                    childRow.Add(col.ColumnName, row[col]);
                }
                parentRow.Add(childRow);
            }
            return jsSerializer.Serialize(parentRow);
        }

        public string ConvertDataTableToJSONwithDictionary(DataTable table)
        {
            var list = new List<Dictionary<string, object>>();

            foreach (DataRow row in table.Rows)
            {
                var dict = new Dictionary<string, object>();

                foreach (DataColumn col in table.Columns)
                {
                    dict[col.ColumnName] = row[col];
                }
                list.Add(dict);
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(list);
        }
    }
}
