using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (Request.Cookies["uname"] != null && Request.Cookies["pwd"] != null)
                {
                    Session["user"] = Request.Cookies["uname"].Value;
                    Response.Redirect("menu.aspx");
                }                       
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
            userlinqDataContext db = new userlinqDataContext();
            var query = (from i in db.GetTable<customer>()
                        where i.c_uname == TextBox1.Text && i.c_password == TextBox2.Text
                        select i).ToList();
            
            if (query.Any())
            {   
                               
                if (CheckBox1.Checked)
                {
                    Response.Cookies["uname"].Value = TextBox1.Text;
                    Response.Cookies["pwd"].Value = TextBox2.Text;
                    Response.Cookies["uname"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);                    
                }               
                else
                {
                    Response.Cookies["uname"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                }
                Session["user"] = TextBox1.Text;
                Response.Redirect("menu.aspx");
            }
            else
            {
                Label1.Text = "invalid username or password";
            }
            }               
    }
}