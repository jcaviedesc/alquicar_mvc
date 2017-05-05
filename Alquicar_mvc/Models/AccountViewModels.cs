using conexion;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Alquicar_mvc.Models
{
    
    public class ExternalLoginConfirmationViewModel
    {
        
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        Connection connLogin = new Connection();

        [Required]
        [Display(Name = "E-mail")]
        [EmailAddress]
        public string Email { get; set; }
     
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }


        public System.Data.DataTable QueryUser(LoginViewModel user)
        {
            Parameter[] data_user = new Parameter[2];
            data_user[0] = new Parameter("_email", user.Email);
            data_user[1] = new Parameter("_password", user.Password);
            return connLogin.Query("PR_OAuth_LOGIN", data_user);
        }

    }

    public class RegisterViewModel
    {
        //my conenction 
        Connection connRegister = new Connection();

        //[Required]
        //[Display(Name = "Nombre")]
        //[DataType(DataType.Text)]
        //public string Nombre { get; set; }

        //[Required]
        //[Display(Name = "Apellido")]
        //[DataType(DataType.Text)]
        //public string Apellido { get; set; }

        //[Required]
        //[Display(Name = "Genero")]
        //public string Genero { get; set; }

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

        //public string Tipo_cliente { get; set; }

        //public string Num_identificacion { get; set; }

        //[Required]
        //[Display(Name = "Celular")]
        //[DataType(DataType.PhoneNumber)]
        //public string Phone { get; set; }

        //methods for register in the data base
        //public bool registrarUsur(RegisterViewModel us)
        //{
        //    Parameter[] para = new Parameter[8];
        //    para[0] = new Parameter("_nombres", us.Nombre);
        //    para[1] = new Parameter("_apellidos", us.Apellido);
        //    para[2] = new Parameter("_genero", us.Genero);
        //    para[3] = new Parameter("_email", us.Email);
        //    para[4] = new Parameter("_password", us.Password);
        //    para[5] = new Parameter("_tipo_cliente", us.Tipo_cliente);
        //    para[6] = new Parameter("_num_identificacion", us.Num_identificacion);
        //    para[7] = new Parameter("_phone", us.Phone);

        //    Transaction[] trans = new Transaction[1];
        //    trans[0] = new Transaction("PR_INSRCLIENTE", para);
        //    return connRegister.Transaction(trans);
        //}

    }

    public class ResetPasswordViewModel
    {
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

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
