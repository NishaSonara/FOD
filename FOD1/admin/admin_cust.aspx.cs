using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.admin
{
    public partial class admin_cust : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                adminlinqDataContext db = new adminlinqDataContext();

                GridView1.DataSource = db.customers;

                GridView1.DataBind();
                Label1.Text = "Total Customer:" + GridView1.Rows.Count;


            }
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");
            }
           
               
        }
    }
}