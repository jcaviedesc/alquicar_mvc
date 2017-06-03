using conexion;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Alquicar_mvc.Models
{
    public class CreateUserModel
    {
        Connection conbd = new Connection();

        public string Rol { get; set; }

        public string Nombres { get; set; }

        public string Apellidos { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Permissions { get; set; }

        public System.Data.DataTable QueryPermissions()
        {
            return conbd.Query("PR_QUERYPERMISSIONS", null);
        }

        public System.Data.DataTable QueryRoles() {
            return conbd.Query("PR_QUERYROLES",null);
        }

        public bool RegisterUser(CreateUserModel user) {
            Parameter[] para = new Parameter[6];
            para[0] = new Parameter("_email",user.Email);
            para[1] = new Parameter("_password",user.Password);
            para[2] = new Parameter("_permissions", user.Permissions);
            para[3] = new Parameter("_rol",user.Rol);
            para[4] = new Parameter("_nombre",user.Nombres);
            para[5] = new Parameter("_apellido", user.Apellidos);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("PR_CREATEUSER", para);
            return conbd.Transaction(trans);
        }
    }
}