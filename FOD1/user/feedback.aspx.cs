using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          if(Session["user"]==null)
            {
                Response.Redirect("~/user/login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            userlinqDataContext db = new userlinqDataContext();
            feedback f = new feedback();            
            var q = db.customers.SingleOrDefault(s => s.c_uname == Session["user"].ToString());
            
            f.c_id = q.c_id;
            f.f_name = TextBox1.Text.ToString();
            db.feedbacks.InsertOnSubmit(f);
            db.SubmitChanges();
            Response.Redirect("~/user/userhome.aspx");
            
        }
    }
}