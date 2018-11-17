using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
namespace food_ordering_system.admin
{
    public partial class admin_payment : System.Web.UI.Page
    {
        adminlinqDataContext db = new adminlinqDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"]!=null)
            {
             if(!IsPostBack)
                {
                    GridView1.DataSource = db.orders.OrderByDescending(s=>s.o_date);
                    GridView1.DataBind();
                    Label1.Text = "Total Order:" + GridView1.Rows.Count;
                    int q = db.orders.Where(s => s.o_date == System.DateTime.Today).Count();
                    Label2.Text = "Total order of today:" + q;

                }

            }
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");

            }
        }
        
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = db.orders.OrderByDescending(s=>s.o_date);
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string q = (row.FindControl("DropDownList1") as DropDownList).SelectedItem.Text;
            
            
            order o = db.orders.FirstOrDefault(s=> s.o_id==Convert.ToInt32( row.Cells[0].Text));
            o.o_status = q;
            GridView1.EditIndex = -1;
            db.SubmitChanges();
            GridView1.DataSource = db.orders.OrderByDescending(s=>s.o_date);
            GridView1.DataBind();
            


        }

        
        }
}            
        


       
    
