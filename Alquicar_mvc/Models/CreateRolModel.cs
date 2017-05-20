using conexion;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Alquicar_mvc.Models
{
    public class CreateRolModel
    {
        Connection rolconn = new Connection();

        [Display(Name ="Nombre del rol")]
        public string rol_name { get; set; }

        public string Permissions { get; set; }

        public System.Data.DataTable QueryPermissionRol()
        {
            return rolconn.Query("PR_QUERYPERMISSIONS", null);
        }

        public bool RegisterRol(CreateRolModel Role)
        {
            Parameter[] para = new Parameter[2];
            para[0] = new Parameter("_name_rol", Role.rol_name);
            para[1] = new Parameter("_rol_Permissions", Role.Permissions);
           
            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("PR_INSERTROL", para);
            return rolconn.Transaction(trans);
        }

    }
}