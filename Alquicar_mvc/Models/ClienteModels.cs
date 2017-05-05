using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using conexion;


namespace ArquitecturaMVC.Models
{
    public class ClienteModels
    {
         Connection conn = new Connection();


        public string nombre { set; get; }
        public string apellido { set; get; }
        public string genero { set; get; }
        public string email { set; get; }
        public string password { set; get;}
        public string tipo_cliente { set; get; }
        public string num_identificacion { set; get; }
        public string phone { set; get; }
        public string fecha_n { set; get; }

        public System.Data.DataTable QueryUser()
        {
            return conn.Query("PR_QERYUSUARIOS", null);
        }

        public bool registrarUsur(ClienteModels us)
        {
            Parameter[] para = new Parameter[9];
            para[0] = new Parameter("_nombres", us.nombre);
            para[1] = new Parameter("_apellidos", us.apellido);
            para[2] = new Parameter("_genero", us.genero);
            para[3] = new Parameter("_email", us.email);
            para[4] = new Parameter("_password", us.password);
            para[5] = new Parameter("_tipo_cliente",us.tipo_cliente);
            para[6] = new Parameter("_num_identificacion", us.num_identificacion);
            para[7] = new Parameter("_phone",us.phone);
            para[8] = new Parameter("_fe_nacimiento", us.fecha_n);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("PR_INSRCLIENTE", para);
            return conn.Transaction(trans);
        }
    }
}
