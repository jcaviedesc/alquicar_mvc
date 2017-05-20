using conexion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alquicar_mvc.Models
{
    public class DatosBasicosModel
    {
        Connection basicdata = new Connection();

        public System.Data.DataTable QueryGenero()
        {
            return basicdata.Query("PR_QUERY_GENERO", null);
        }
        public System.Data.DataTable QueryTiposPer()
        {
            return basicdata.Query("PR_QUERY_TIPOPER", null);
        }
    }
}