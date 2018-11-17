using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class myorder : System.Web.UI.Page
    {
        userlinqDataContext db = new userlinqDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]!=null)
            {
                Label1.Visible = false;
                var q = db.customers.FirstOrDefault(s => s.c_uname == Session["user"].ToString());
                var x = db.orders.Where(s => s.c_id == q.c_id).OrderByDescending(s=>s.o_date);
                GridView1.DataSource = x;
                GridView1.DataBind();
                if(GridView1.Rows.Count==0)
                {
                    Label1.Visible = true;
                    Label1.Text = "You don't Order yet!";
                }
            }   
            else
            {
                Response.Redirect("~/user/login.aspx");
            }
            
        }
    }
}