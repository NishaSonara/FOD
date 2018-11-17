using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.admin
{
    public partial class updateitem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"]!=null && Session["n"]!=null)
            {                
                if (!IsPostBack)
                {
                    adminlinqDataContext db = new adminlinqDataContext();
                    item i = db.items.FirstOrDefault(a => a.i_no == Convert.ToInt32(Session["n"]));

                    TextBox2.Text = i.i_name;
                    TextBox3.Text = i.i_details;
                    TextBox4.Text = i.i_price.ToString();
                    DropDownList1.SelectedValue = i.i_status;
                    TextBox1.Text = i.i_disc.ToString();
                }
                Label1.Text = Session["n"].ToString();
            }
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            adminlinqDataContext db = new adminlinqDataContext();
           
            var i = db.items.FirstOrDefault(a => a.i_no == Convert.ToInt32(Session["n"]));

            i.i_name = TextBox2.Text;
            i.i_details = TextBox3.Text;
            i.i_price = Convert.ToInt32(TextBox4.Text);
            i.i_status = DropDownList1.SelectedValue;
            i.i_disc =Convert.ToDecimal(TextBox1.Text);
            db.SubmitChanges();
            
            Response.Redirect("admin_item.aspx");

        }

        

        
    }
}