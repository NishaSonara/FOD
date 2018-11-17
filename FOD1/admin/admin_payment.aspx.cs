using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"]!=null)
            {
                adminlinqDataContext db = new adminlinqDataContext();
                GridView1.DataSource = db.payments.OrderByDescending(s=>s.p_date) ;
                GridView1.DataBind();
                if(db.payments.Select(s=>s.total_amount).Count()>0)
                {
                    Label1.Text = "Total Payment:" + db.payments.Select(s => s.total_amount).Sum();
                    if(db.payments.Where(s => s.p_date == DateTime.Now).Select(s => s.total_amount).Count()>0)
                    {
                        var q = db.payments.Where(s => s.p_date == DateTime.Now).Select(s => s.total_amount).Sum();
                        Label2.Text = "Total Payment of today:" + q;
                    }
                    else
                    {
                        Label2.Text = "Total Payment of today:0" ;
                    }
                    
                }
                else
                {
                    Label1.Text = "Total Payment:0";
                    Label2.Text = "Total Payment of today:0";
                }
            }
                
               
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");
            }
            
        }
    }
}