using conexion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Alquicar_mvc.Models
{
    public class SearchCarModel
    {
        Connection tunelcar = new Connection();

        string tipo_vehiculo { set; get; }
        string tipo_direccion { set; get; }
        string tipo_trasmicion { set; get; }
        string marca {set; get;}

        public System.Data.DataTable QueryAutos(SearchCarModel car)
        {
            Parameter[] para = new Parameter[4];
            para[0] = new Parameter("_tipo_vehiculo", car.tipo_vehiculo);
            para[1] = new Parameter("_tipo_direccion", car.tipo_vehiculo);
            para[2] = new Parameter("_tipo_transmicion", car.tipo_vehiculo);
            para[3] = new Parameter("_marca", car.tipo_vehiculo);
            return tunelcar.Query("PR_QERYAUTOS", null);
        }


    }
}