using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Alquicar_mvc.Controllers
{
    public class SeekCarController : ApiController
    {
        // GET: api/SeekCar
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        public IHttpActionResult cars()
        {
            return Json("value1value2");
        }


        // GET: api/SeekCar/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/SeekCar
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/SeekCar/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/SeekCar/5
        public void Delete(int id)
        {
        }
    }
}
