using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.WebHost;

namespace Alquicar_mvc.App_Start
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            // Configure Web API to use only bearer token authentication.
            //    config.SuppressDefaultHostAuthentication();
            //    config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

            //    // Use camel case for JSON data.
            //    config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();

            //    // Web API routes
            //    config.MapHttpAttributeRoutes();

            //    var httpControllerRouteHandler = typeof(HttpControllerRouteHandler).GetField("_instance",
            //        System.Reflection.BindingFlags.Static | System.Reflection.BindingFlags.NonPublic);

            //    if (httpControllerRouteHandler != null)
            //    {
            //        httpControllerRouteHandler.SetValue(null,
            //            new Lazy<HttpControllerRouteHandler>(() => new SessionHttpControllerRouteHandler(), true));
            //    }

            //    config.Routes.MapHttpRoute(
            //        name: "DefaultApi",
            //        routeTemplate: "api/{controller}/{action}/{id}",
            //        defaults: new { id = RouteParameter.Optional }
            //    );
        }
    }
}