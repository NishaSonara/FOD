using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/user/login.aspx");
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            userlinqDataContext db = new userlinqDataContext();

            var query = from i in db.customers
                        where i.c_uname == Session["user"].ToString() && i.c_password == args.Value
                        select i;

            if(query.Any())
            {
                args.IsValid=true;
            }
            else
            {
                args.IsValid = false;
                HyperLink1.Visible = true;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length> 8)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                userlinqDataContext db = new userlinqDataContext();
                customer c = db.customers.FirstOrDefault(i => i.c_uname == Session["user"].ToString());

                c.c_password = TextBox2.Text;


                db.SubmitChanges();

                Label1.Text = "change password successfully!";
            }
                       
        }
    }
}