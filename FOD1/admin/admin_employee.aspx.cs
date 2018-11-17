using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.admin
{
    public partial class admin_employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"]!=null)
            {
                adminlinqDataContext db = new adminlinqDataContext();
                var q = from x in db.employees
                        select x;
                GridView1.DataSource = q;

                GridView1.DataBind();


            }
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");

            }
        }
    }
}