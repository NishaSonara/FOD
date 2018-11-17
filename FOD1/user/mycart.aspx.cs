using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace food_ordering_system.user
{
    public partial class mycart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if(Session["user"]!=null)
            {
                if (!IsPostBack)
                {
                    if (Session["arr"] != null || Session["cartdetails"]!=null)
                    {
                        string[] arr = (string[])Session["arr"];

                        for (int i = 0; i < arr.Length; i++)
                        {
                            ListBox1.Items.Add(arr[i].ToString());
                        }
                        gridbind();
                        Label2.Text = "Total item in cart:" + GridView1.Rows.Count;
                    }
                    else
                    {
                       
                            Label2.Text = "Your cart is empty";
                        Label1.Text = "0";
                            Button2.Visible = false;
                        Button1.CssClass = "mymenu";
                    }
                    

                }

            }
            else
            {
                Response.Redirect("~/user/login.aspx");

            }

        }
        public void gridbind()
        {
            DataTable dt = (DataTable)Session["cartdetails"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
           totalamount();
        }
        public void totalamount()
        {
            double total = 0;
            DataTable dt = (DataTable)Session["cartdetails"];
            foreach(DataRow row in dt.Rows)
            {
                 total = total + Convert.ToDouble( row["Amount"]);
            }
            Label1.Text =total.ToString();
            
            if(total==0)
            {
                Label2.Text = "Your Cart is empty";
                Button2.Visible = false;
                Button1.CssClass = "mymenu";
            }
            else
            {
                Label2.Text = "Total item in cart:" + GridView1.Rows.Count;
                
            }
          
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["cartdetails"];
            dt.Rows.RemoveAt(e.RowIndex);
            dt.AcceptChanges();
            GridView1.DataSource = dt;
            GridView1.DataBind();

            Session["cartdetails"] = dt;
        

            string id = e.Keys["ProductNo"].ToString();
            ListBox1.Items.Remove(id);

            int n = ListBox1.Items.Count;
            string[] arr = new string[n];

            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = ListBox1.Items[i].ToString();
            }
            Session["arr"] = arr;            
            totalamount();
        }

        
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gridbind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string qty = (row.FindControl("txtqty") as TextBox).Text;

            //int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            DataTable dt = (DataTable)Session["cartdetails"];
            DataRow r = dt.Rows[e.RowIndex];
            r["Qty"] = qty;
            GridView1.EditIndex = -1;
            Session["cartdetails"] = dt;
            r["Amount"] = (Convert.ToDecimal(r["Price"]) * Convert.ToInt32(r["Qty"])) - (Convert.ToDecimal(r["Discount"]) / 100 * Convert.ToInt32(r["Qty"]) * Convert.ToDecimal(r["Price"]));
            totalamount();
            gridbind();



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["total"] = Label1.Text;
            Response.Redirect("~/user/bill.aspx");
        }
    }
}