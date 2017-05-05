using Alquicar_mvc.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Alquicar_mvc.Controllers
{
    public class marcasController : ApiController
    {
        RegisterCarModels carmodel = new RegisterCarModels();
        // GET: api/marcas
        public IHttpActionResult Get()
        {
            DataTable dtmarcas = carmodel.QueryMarcas();
            return Json(dtmarcas);
        }

        // GET: api/marcas/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/marcas
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/marcas/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/marcas/5
        public void Delete(int id)
        {
        }
    }
}
