using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class homefeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userlinqDataContext db = new userlinqDataContext();
            GridView1.DataSource = db.feedbacks;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                userlinqDataContext db = new userlinqDataContext();
                feedback f = new feedback();
                var q = db.customers.FirstOrDefault(s => s.c_uname == TextBox2.Text);

                f.c_id = q.c_id;
                f.f_name = TextBox1.Text.ToString();
                db.feedbacks.InsertOnSubmit(f);
                db.SubmitChanges();
                Response.Redirect("~/user/home.aspx");

            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        { 
                userlinqDataContext db = new userlinqDataContext();
                var query = (from i in db.GetTable<customer>()
                             where i.c_uname == TextBox2.Text
                             select i).ToList();

                if (query.Any())
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
         
        }
            
         
    }
}