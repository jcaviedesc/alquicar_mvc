using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Alquicar_mvc.Models;
using System.Data;

namespace Alquicar_mvc.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        LoginViewModel usercon = new LoginViewModel();
        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager )
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set 
            { 
                _signInManager = value; 
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel userLog, string returnUrl)
        {
            borrarSesion();
            if (ModelState.IsValid)
            {
                DataTable login = usercon.QueryUser(userLog);
                string status = login.Rows[0]["status"].ToString();
                if (status == "OK"){
                    Session["status"] = status;
                    Session["nombre_user"] = login.Rows[0]["Nombres"].ToString()+" "+login.Rows[0]["Apellidos"].ToString(); 
                    string rol = login.Rows[0]["rol_name"].ToString();
                    Session["user_id"] = login.Rows[0]["Id"];// id de empleado
                    Session["email"] = userLog.Email;
                    Session["rol"] = rol;
                    if (rol != "default") {
                        string per = login.Rows[0].ItemArray[10].ToString();
                    
                        Session["menu"] = crearmenu(per);
                        return RedirectToAction("Index", "Dashboard");
                    }else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    
                }
                else
                {
                    ViewBag.description = login.Rows[0]["description"].ToString();
                    return View();
                }
            }
            else
            {
                return View(userLog);
            }
        }

        public IHtmlString crearmenu(string permisos) {
            char delimiter = ',';
            string finalpermisos = "<li>";
            bool registrarbool = false;
            string[] araypermisos = permisos.Split(delimiter);
            foreach (var p in araypermisos) {
                if (p.Equals("1"))
                {
                    finalpermisos += "<a class='mdl-navigation__link' href='../CreateUser/create'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>person_add</i> Crear Usuario</a></li>";
                }
                else if (p.Equals("2"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../CreateRol/Create'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>domain</i> Crear Rol</a></li>";
                }
                else if (p.Equals("3"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../Cliente/create'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>portrait</i>Registrar cliente</a></li>";
                }
                else if (p.Equals("4"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../Proveedor/create'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>directions_walk</i>Registrar proveedor</a></li>";
                }
                else if (p.Equals("5"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../Alquiler/create'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>account_balance_wallet</i>Registar alquiler</a></li>";
                }
                else if (p.Equals("6"))
                {
                    finalpermisos += " <li><a class='mdl-navigation__link' href='../RegisterCar/create'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>directions_car</i>Registrar auto</a></li>";
                }
                else if (p.Equals("7"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../RegisterCar'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>directions_car</i>Repor Autos</a></li>";
                }
                else if (p.Equals("8"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../Alquiler'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>account_balance_wallet</i>Repor Alquileres</a></li>";
                }
                else if (p.Equals("9"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../cliente'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>portrait</i>Repor Clientes</a></li>";
                }
                else if (p.Equals("10"))
                {
                    finalpermisos += "<li><a class='mdl-navigation__link' href='../Alquiler/devolucion'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>portrait</i>Devolucino auto</a></li>";
                }

                //else if (p.Equals("4") || p.Equals("5") || p.Equals("6") || p.Equals("1")) {
                //    if (registrarbool) {
                //        finalpermisos += "<li class='treview'><a class='mdl-navigation__link' href='#'><i class='mdl-color-text--blue-grey-400 material-icons' role='presentation'>receipt</i><span>Registrar</span>";
                //        finalpermisos += "<span class='pull-right-container'><i class='fa-angle-left pull-right material-icons'>keyboard_arrow_down</i></span></a>";
                //        finalpermisos += "<ul id = 'registros' class='treeview-menu'>";
                //        registrarbool = false;
                //    }

                //}

            }
            //return Server.HtmlEncode(finalpermisos);
            IHtmlString response = new HtmlString(finalpermisos);
            return response;
        }
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(model);
        //    }

        // //   This doesn't count login failures towards account lockout
        // //To enable password failures to trigger account lockout, change to shouldLockout: true
        //var result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
        //    switch (result)
        //    {
        //        case SignInStatus.Success:
        //            return RedirectToLocal(returnUrl);
        //        case SignInStatus.LockedOut:
        //            return View("Lockout");
        //        case SignInStatus.RequiresVerification:
        //            return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
        //        case SignInStatus.Failure:
        //        default:
        //            ModelState.AddModelError("", "Invalid login attempt.");
        //            return View(model);
        //    }
        //}

        //
        // GET: /Account/VerifyCode
        //[AllowAnonymous]
        //public async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        //{
        //    // Require that the user has already logged in via username/password or external login
        //    if (!await SignInManager.HasBeenVerifiedAsync())
        //    {
        //        return View("Error");
        //    }
        //    return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        //}

        ////
        //// POST: /Account/VerifyCode
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(model);
        //    }

        //    // The following code protects for brute force attacks against the two factor codes. 
        //    // If a user enters incorrect codes for a specified amount of time then the user account 
        //    // will be locked out for a specified amount of time. 
        //    // You can configure the account lockout settings in IdentityConfig
        //    var result = await SignInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent:  model.RememberMe, rememberBrowser: model.RememberBrowser);
        //    switch (result)
        //    {
        //        case SignInStatus.Success:
        //            return RedirectToLocal(model.ReturnUrl);
        //        case SignInStatus.LockedOut:
        //            return View("Lockout");
        //        case SignInStatus.Failure:
        //        default:
        //            ModelState.AddModelError("", "Invalid code.");
        //            return View(model);
        //    }
        //}

        ////
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    await SignInManager.SignInAsync(user, isPersistent:false, rememberBrowser:false);
                    
                    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    // Send an email with this link
                    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                    return RedirectToAction("Index", "Home");
                }
                //AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ConfirmEmail
        //[AllowAnonymous]
        //public async Task<ActionResult> ConfirmEmail(string userId, string code)
        //{
        //    if (userId == null || code == null)
        //    {
        //        return View("Error");
        //    }
        //    var result = await UserManager.ConfirmEmailAsync(userId, code);
        //    return View(result.Succeeded ? "ConfirmEmail" : "Error");
        //}

        ////
        //// GET: /Account/ForgotPassword
        //[AllowAnonymous]
        //public ActionResult ForgotPassword()
        //{
        //    return View();
        //}

        ////
        //// POST: /Account/ForgotPassword
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var user = await UserManager.FindByNameAsync(model.Email);
        //        if (user == null || !(await UserManager.IsEmailConfirmedAsync(user.Id)))
        //        {
        //            // Don't reveal that the user does not exist or is not confirmed
        //            return View("ForgotPasswordConfirmation");
        //        }

        //        // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
        //        // Send an email with this link
        //        // string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
        //        // var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);		
        //        // await UserManager.SendEmailAsync(user.Id, "Reset Password", "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>");
        //        // return RedirectToAction("ForgotPasswordConfirmation", "Account");
        //    }

        //    // If we got this far, something failed, redisplay form
        //    return View(model);
        //}

        ////
        //// GET: /Account/ForgotPasswordConfirmation
        //[AllowAnonymous]
        //public ActionResult ForgotPasswordConfirmation()
        //{
        //    return View();
        //}

        ////
        //// GET: /Account/ResetPassword
        //[AllowAnonymous]
        //public ActionResult ResetPassword(string code)
        //{
        //    return code == null ? View("Error") : View();
        //}

        ////
        //// POST: /Account/ResetPassword
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(model);
        //    }
        //    var user = await UserManager.FindByNameAsync(model.Email);
        //    if (user == null)
        //    {
        //        // Don't reveal that the user does not exist
        //        return RedirectToAction("ResetPasswordConfirmation", "Account");
        //    }
        //    var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
        //    if (result.Succeeded)
        //    {
        //        return RedirectToAction("ResetPasswordConfirmation", "Account");
        //    }
        //    AddErrors(result);
        //    return View();
        //}

        ////
        //// GET: /Account/ResetPasswordConfirmation
        //[AllowAnonymous]
        //public ActionResult ResetPasswordConfirmation()
        //{
        //    return View();
        //}

        ////
        //// POST: /Account/ExternalLogin
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public ActionResult ExternalLogin(string provider, string returnUrl)
        //{
        //    // Request a redirect to the external login provider
        //    return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        //}

        ////
        //// GET: /Account/SendCode
        //[AllowAnonymous]
        //public async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        //{
        //    var userId = await SignInManager.GetVerifiedUserIdAsync();
        //    if (userId == null)
        //    {
        //        return View("Error");
        //    }
        //    var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
        //    var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
        //    return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl, RememberMe = rememberMe });
        //}

        ////
        //// POST: /Account/SendCode
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> SendCode(SendCodeViewModel model)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View();
        //    }

        //    // Generate the token and send it
        //    if (!await SignInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
        //    {
        //        return View("Error");
        //    }
        //    return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        //}

        ////
        //// GET: /Account/ExternalLoginCallback
        //[AllowAnonymous]
        //public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        //{
        //    var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
        //    if (loginInfo == null)
        //    {
        //        return RedirectToAction("Login");
        //    }

        //    // Sign in the user with this external login provider if the user already has a login
        //    var result = await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
        //    switch (result)
        //    {
        //        case SignInStatus.Success:
        //            return RedirectToLocal(returnUrl);
        //        case SignInStatus.LockedOut:
        //            return View("Lockout");
        //        case SignInStatus.RequiresVerification:
        //            return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = false });
        //        case SignInStatus.Failure:
        //        default:
        //            // If the user does not have an account, then prompt the user to create an account
        //            ViewBag.ReturnUrl = returnUrl;
        //            ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
        //            return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
        //    }
        //}

        ////
        //// POST: /Account/ExternalLoginConfirmation
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        //{
        //    if (User.Identity.IsAuthenticated)
        //    {
        //        return RedirectToAction("Index", "Manage");
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        // Get the information about the user from the external login provider
        //        var info = await AuthenticationManager.GetExternalLoginInfoAsync();
        //        if (info == null)
        //        {
        //            return View("ExternalLoginFailure");
        //        }
        //        var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
        //        var result = await UserManager.CreateAsync(user);
        //        if (result.Succeeded)
        //        {
        //            result = await UserManager.AddLoginAsync(user.Id, info.Login);
        //            if (result.Succeeded)
        //            {
        //                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
        //                return RedirectToLocal(returnUrl);
        //            }
        //        }
        //        AddErrors(result);
        //    }

        //    ViewBag.ReturnUrl = returnUrl;
        //    return View(model);
        //}

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult salir()
        {         
            borrarSesion();
            //AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public ActionResult saliruser()
        {
            Session.RemoveAll();
            return RedirectToAction("Index", "Home");
        }
        private void borrarSesion()
        {
            Session.RemoveAll();
        }

        //
        //// GET: /Account/ExternalLoginFailure
        //[AllowAnonymous]
        //public ActionResult ExternalLoginFailure()
        //{
        //    return View();
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        if (_userManager != null)
        //        {
        //            _userManager.Dispose();
        //            _userManager = null;
        //        }

        //        if (_signInManager != null)
        //        {
        //            _signInManager.Dispose();
        //            _signInManager = null;
        //        }
        //    }

        //    base.Dispose(disposing);
        //}

        //#region Helpers
        //// Used for XSRF protection when adding external logins
        //private const string XsrfKey = "XsrfId";

        //private IAuthenticationManager AuthenticationManager
        //{
        //    get
        //    {
        //        return HttpContext.GetOwinContext().Authentication;
        //    }
        //}

        //private void AddErrors(IdentityResult result)
        //{
        //    foreach (var error in result.Errors)
        //    {
        //        ModelState.AddModelError("", error);
        //    }
        //}

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

    //    internal class ChallengeResult : HttpUnauthorizedResult
    //    {
    //        public ChallengeResult(string provider, string redirectUri)
    //            : this(provider, redirectUri, null)
    //        {
    //        }

    //        public ChallengeResult(string provider, string redirectUri, string userId)
    //        {
    //            LoginProvider = provider;
    //            RedirectUri = redirectUri;
    //            UserId = userId;
    //        }

    //        public string LoginProvider { get; set; }
    //        public string RedirectUri { get; set; }
    //        public string UserId { get; set; }

    //        public override void ExecuteResult(ControllerContext context)
    //        {
    //            var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
    //            if (UserId != null)
    //            {
    //                properties.Dictionary[XsrfKey] = UserId;
    //            }
    //            context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
    //        }
    //    }
    //    #endregion
    }
}