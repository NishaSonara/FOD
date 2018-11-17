using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            if(Request.Cookies["uname"]!=null && Request.Cookies["pwd"]!=null )
            {
                Response.Cookies["uname"].Expires = DateTime.Now.AddDays(-30);
                Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-30);
            }
            Response.Redirect("~/user/home.aspx");
        }
    }
}