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
    public partial class homemenu : System.Web.UI.Page
    {
        userlinqDataContext db = new userlinqDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]==null)
            {
                if (!IsPostBack)
                {
                    gridbind();
                    DropDownList1.SelectedIndex = 0;
                    if (DropDownList1.SelectedIndex == 0)
                    {
                        DropDownList2.Items.Clear();
                        DropDownList2.Items.Add("100");
                        DropDownList2.Items.Add("200");
                        DropDownList2.Items.Add("500");
                        DropDownList2.Items.Add("1000");
                        DropDownList2.SelectedItem.Text = "1000";
                    }

                    Label1.Text = "Total Item In Cart:" + ListBox1.Items.Count;

                }

            }
            else
            {
                Response.Redirect("~/user/logout.aspx");
            }
            }
        public void gridbind()
        {
            GridView1.DataSource = db.items.Where(s => s.i_status == "A");
            GridView1.DataBind();

        }
        protected void Button1_Click(object sender, EventArgs e)
        {            
                Response.Redirect("~/user/login.aspx");            
          
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add("100");
                DropDownList2.Items.Add("200");
                DropDownList2.Items.Add("500");
                DropDownList2.Items.Add("1000");
            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add("200");
                DropDownList2.Items.Add("500");
                DropDownList2.Items.Add("1000");
            }

            else if (DropDownList1.SelectedIndex == 2)
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add("400");
                DropDownList2.Items.Add("500");
                DropDownList2.Items.Add("1000");
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add("600");
                DropDownList2.Items.Add("800");
                DropDownList2.Items.Add("1000");
            }
            DropDownList2.SelectedValue = "1000";
            var q = db.items.Where(s => s.i_price >= Convert.ToInt32(DropDownList1.SelectedValue) && s.i_price <= Convert.ToInt32(DropDownList2.SelectedValue) && s.i_status == "A");
            GridView1.DataSource = q;
            GridView1.DataBind();
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridbind();
            RadioButtonList2.SelectedIndex = -1;
            if (RadioButtonList1.SelectedIndex == 0)
            {

                Panel3.Visible = true;
                Panel5.Visible = false;

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                Panel5.Visible = true;
                Panel3.Visible = false;

                DropDownList4.SelectedIndex = 0;
                var q = db.items.Where(s => s.i_disc <= 10 && s.i_status == "A");
                GridView1.DataSource = q;

            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            var q = db.items.Where(s => s.i_price >= Convert.ToInt32(DropDownList1.SelectedValue) && s.i_price <= Convert.ToInt32(DropDownList2.SelectedValue) && s.i_status == "A");
            GridView1.DataSource = q;
            GridView1.DataBind();
        }
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList4.SelectedIndex == 0)
            {
                var q = db.items.Where(s => s.i_disc <= 10 && s.i_status == "A");
                GridView1.DataSource = q;
            }
            else if (DropDownList4.SelectedIndex == 1)
            {
                var q = db.items.Where(s => s.i_disc > 10 && s.i_disc <= 30 && s.i_status == "A");
                GridView1.DataSource = q;

            }
            else if (DropDownList4.SelectedIndex == 2)
            {
                var q = db.items.Where(s => s.i_disc > 30 && s.i_disc <= 50 && s.i_status == "A");
                GridView1.DataSource = q;
            }
            else if (DropDownList4.SelectedIndex == 3)
            {
                var q = db.items.Where(s => s.i_disc > 50 && s.i_status == "A");
                GridView1.DataSource = q;
            }
            GridView1.DataBind();

        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedIndex = -1;
            Panel3.Visible = false;
            Panel5.Visible = false;
            gridbind();
            if (RadioButtonList2.SelectedIndex == 0)
            {
                var q = db.items.OrderBy(s => s.i_no);
                GridView1.DataSource = q;
            }
            else if (RadioButtonList2.SelectedIndex == 1)
            {
                var q = db.items.OrderBy(s => s.i_name);
                GridView1.DataSource = q;
            }
            else if (RadioButtonList2.SelectedIndex == 2)
            {
                var q = db.items.OrderBy(s => s.i_price);
                GridView1.DataSource = q;
            }
            else if (RadioButtonList2.SelectedIndex == 3)
            {
                var q = db.items.OrderByDescending(s => s.i_price);
                GridView1.DataSource = q;
            }
            else if (RadioButtonList2.SelectedIndex == 4)
            {
                var q = db.items.OrderBy(s => s.i_disc);
                GridView1.DataSource = q;
            }
            else if (RadioButtonList2.SelectedIndex == 5)
            {
                var q = db.items.OrderByDescending(s => s.i_disc);
                GridView1.DataSource = q;
            }
            GridView1.DataBind();

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cart")
            {
                Response.Redirect("~/user/login.aspx");
            }
            
                
        

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            RadioButtonList2.SelectedIndex = -1;
            gridbind();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedIndex = -1;
            Panel3.Visible = false;
            Panel5.Visible = false;

            gridbind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image img = e.Row.FindControl("Image1") as Image;
                int id = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                var q = db.items.FirstOrDefault(s => s.i_no == id);
                img.ImageUrl = "~/image/item/" + q.i_image;
            }


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var q = db.items.Where(s => s.i_name == TextBox1.Text);
            if (q.Any())
            {
                Label2.Visible = false;
                GridView1.DataSource = q;
                GridView1.DataBind();
            }
            else
            {
                Label2.Visible = true;
                Label2.Text = "Sorry Not available!";
            }


        }
    }
}