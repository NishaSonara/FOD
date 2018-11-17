using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(food_ordering_system.Startup))]
namespace food_ordering_system
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
