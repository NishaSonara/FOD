using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            adminlinqDataContext ad = new adminlinqDataContext();
           var query = (from i in ad.GetTable<admin>()
                        where i.a_name == TextBox1.Text && i.a_password == TextBox2.Text
                        select i).ToList();

            if(query.Any())
            {
                Session["admin"] = TextBox1.Text;
                Response.Redirect("admin_item.aspx");
            }
            else
            {
                Label1.Text = "invalid admin name or password";
            }
        }
    }
}