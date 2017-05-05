using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Alquicar_mvc.Startup))]
namespace Alquicar_mvc
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
