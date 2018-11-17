using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace food_ordering_system.user
{
    public partial class payment : System.Web.UI.Page
    {
        userlinqDataContext db = new userlinqDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {        
            if(Session["user"]!= null && Session["total"] != null)
            {
                if (!IsPostBack)
                {
                    for (int i = 1; i <= 12; i++)
                    {
                        DropDownList1.Items.Add(i.ToString());
                    }
                    for (int i = Convert.ToInt32(DateTime.Now.Year); i <= Convert.ToInt32(DateTime.Now.Year) + 10; i++)
                    {
                        DropDownList2.Items.Add(i.ToString());
                    }
                    DropDownList2.SelectedIndex = 5;

                    var q = db.customers.SingleOrDefault(s=>s.c_uname==Session["user"].ToString());
                    TextBox4.Text = q.c_address;
                }

                Label1.Text = Session["total"].ToString();

            }
            else
            {
                Response.Redirect("~/user/login.aspx");

            }   
           
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                Panel1.Visible = false;
                Button1.Visible = true;
                

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                Panel1.Visible = true;
                Button1.Visible = true;
            }
        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {
            order o = new order();
            employee t = new employee();
            var q = db.customers.FirstOrDefault(s => s.c_uname == Session["user"].ToString());
            o.c_id = q.c_id;
            o.o_status = "Order Accepted";
           
            o.o_date = Convert.ToDateTime(DateTime.Now);    

            DataTable dt = (DataTable)Session["cartdetails"];
            int qty = 0;
            foreach (DataRow r in dt.Rows)
            {
                qty = qty + Convert.ToInt32(r["Qty"]);
            }
            o.o_qty = qty;
            db.orders.InsertOnSubmit(o);
            db.SubmitChanges();

            payment p = new payment();
             p.p_mode = RadioButtonList1.SelectedItem.Text;
            p.total_amount = Convert.ToDouble( Session["total"]);
            p.p_date = Convert.ToDateTime(DateTime.Now);
            p.p_status = "paid";
            p.o_id = o.o_id;
            db.payments.InsertOnSubmit(p);
            db.SubmitChanges();
            Session.Remove("cartdetails");
            Session.Remove("arr");
            Response.Redirect("~/user/final.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DateTime.Now.Month != 12)
            {
                if (DropDownList2.SelectedItem.Text == "2016")
                {
                    DropDownList1.Items.Clear();
                    for (int i = DateTime.Now.Month + 1; i <= 12; i++)
                    {
                        DropDownList1.Items.Add(i.ToString());
                    }
                }
            }
            else
            {
                DropDownList2.Items.Remove("2016");
            }                           
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Convert.ToInt32(args.Value) > 000 && Convert.ToInt32(args.Value) <= 999)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
    }
}}