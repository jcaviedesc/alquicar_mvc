using conexion;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Alquicar_mvc.Models
{
    public class ProveedorModel
    {
        Connection conProveedor = new Connection();


        public string Nombres { set; get; }
        public string Apellidos { set; get; }
        public string Genero { set; get; }
        public string Email { set; get; }

        //public string password { set; get; }
        [Display(Name = "Tipo de proveedor")]
        public string tipo_proveedor { set; get; }

        [Display(Name = "Identificacion")]
        public string num_identificacion { set; get; }

        [Display(Name = "Celular")]
        public string phone { set; get; }

        //public string fecha_n { set; get; }
        public bool registrarProveedor(ProveedorModel us)
        {
            Parameter[] para = new Parameter[7];
            para[0] = new Parameter("_nombres", us.Nombres);
            para[1] = new Parameter("_apellidos", us.Apellidos);
            para[2] = new Parameter("_genero", us.Genero);
            para[3] = new Parameter("_email", us.Email);
            //para[4] = new Parameter("_password", us.password);
            para[4] = new Parameter("_tipo_proveedor", us.tipo_proveedor);
            para[5] = new Parameter("_num_identificacion", us.num_identificacion);
            para[6] = new Parameter("_phone", us.phone);
            //para[8] = new Parameter("_fe_nacimiento", us.fecha_n);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("PR_INSRPROVEEDOR", para);
            return conProveedor.Transaction(trans);
        }
    }
}