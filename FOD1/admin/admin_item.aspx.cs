using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
namespace food_ordering_system.admin
{
    public partial class adminitem : System.Web.UI.Page
    {
        adminlinqDataContext db = new adminlinqDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] != null)
            {
                if (!IsPostBack)
                {
                    GridView1.DataSource = db.items;
                    GridView1.DataBind();

                    if (Request.QueryString["val"] != null)
                    {
                        Label1.Text = Request.QueryString["val"];
                    }
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

                }
                else
                {
                    Label1.Visible = false;

                }
                Label2.Text = "Total Item:" + GridView1.Rows.Count;

            }
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");
            }

        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (db.items.Count(a => a.i_no == Convert.ToInt32(args.Value)) == 0)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                item i = db.items.FirstOrDefault(a => a.i_no == Convert.ToInt32(TextBox1.Text));


                db.items.DeleteOnSubmit(i);
                db.SubmitChanges();

                string s = "deleted item successfully!";
                Label2.Text = "Total Item:" + GridView1.Rows.Count;
                Response.Redirect("admin_item.aspx?val=" + s);


            }


        }





        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (db.items.Count(a => a.i_no == Convert.ToInt32(args.Value)) == 0)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["n"] = TextBox2.Text;
                Response.Redirect("admin_updateitem.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            Button5.Focus();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {

            Panel1.Visible = true;
            Panel2.Visible = false;
            Button4.Focus();
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


            var q = db.items.Where(s => s.i_price >= Convert.ToInt32(DropDownList1.SelectedValue) && s.i_price <= Convert.ToInt32(DropDownList2.SelectedValue));
            GridView1.DataSource = q;
            GridView1.DataBind();
            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = db.items;
            GridView1.DataBind();
            RadioButtonList2.SelectedIndex = -1;
            if (RadioButtonList1.SelectedIndex == 0)
            {

                Panel3.Visible = true;
                Panel4.Visible = false;
                Panel5.Visible = false;

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                Panel4.Visible = true;
                Panel3.Visible = false;
                Panel5.Visible = false;
                DropDownList3.SelectedIndex = 0;

                var q = db.items.Where(s => s.i_status == "A");
                GridView1.DataSource = q;
                GridView1.DataBind();


            }
            else if (RadioButtonList1.SelectedIndex == 2)
            {
                Panel5.Visible = true;
                Panel3.Visible = false;
                Panel4.Visible = false;
                DropDownList4.SelectedIndex = 0;
                var q = db.items.Where(s => s.i_disc <= 10);
                GridView1.DataSource = q;
            }
            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            var q = db.items.Where(s => s.i_price >= Convert.ToInt32(DropDownList1.SelectedValue) && s.i_price <= Convert.ToInt32(DropDownList2.SelectedValue));
            GridView1.DataSource = q;
            GridView1.DataBind();
            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedIndex == 0)
            {
                var q = db.items.Where(s => s.i_status == "A");
                GridView1.DataSource = q;
                GridView1.DataBind();

            }
            else if (DropDownList3.SelectedIndex == 1)
            {
                var q = db.items.Where(s => s.i_status == "NA");
                GridView1.DataSource = q;
                GridView1.DataBind();
            }


            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList4.SelectedIndex == 0)
            {
                var q = db.items.Where(s => s.i_disc <= 10);
                GridView1.DataSource = q;
            }
            else if (DropDownList4.SelectedIndex == 1)
            {
                var q = db.items.Where(s => s.i_disc > 10 && s.i_disc <= 30);
                GridView1.DataSource = q;

            }
            else if (DropDownList4.SelectedIndex == 2)
            {
                var q = db.items.Where(s => s.i_disc > 30 && s.i_disc <= 50);
                GridView1.DataSource = q;
            }
            else if (DropDownList4.SelectedIndex == 3)
            {
                var q = db.items.Where(s => s.i_disc > 50);
                GridView1.DataSource = q;
            }
            GridView1.DataBind();
            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            GridView1.DataSource = db.items;
            GridView1.DataBind();
            RadioButtonList1.SelectedIndex = -1;
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
            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedIndex = -1;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            GridView1.DataSource = db.items;
            GridView1.DataBind();

            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

            RadioButtonList2.SelectedIndex = -1;
            GridView1.DataSource = db.items;
            GridView1.DataBind();

            Label2.Text = "Total Item:" + GridView1.Rows.Count;
        }

        

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image img = e.Row.FindControl("Image1") as Image;
                int id = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                 var q = db.items.FirstOrDefault(s => s.i_no == id);
                img.ImageUrl ="~/image/item/"+q.i_image; 
            }

        }
    }
}