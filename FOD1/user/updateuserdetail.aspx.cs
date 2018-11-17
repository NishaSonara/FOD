using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace food_ordering_system.user
{
    public partial class updateuserdetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]!=null)
            {
                if (!IsPostBack)
                {
                    if(Request.Cookies["uname"]!=null && Request.Cookies["pwd"]!=null)
                    {
                        Session["user"] = Request.Cookies["uname"].Value;
                    }
                    userlinqDataContext db = new userlinqDataContext();


                    var q = db.customers.FirstOrDefault(i => i.c_uname == Session["user"].ToString());

                    DropDownList2.DataSource = db.countries;
                    DropDownList2.DataTextField = "countryname";
                    DropDownList2.DataValueField = "countryId";
                    DropDownList2.DataBind();
                    DropDownList3.DataSource = db.states;
                    DropDownList3.DataTextField = "statename";
                    DropDownList3.DataValueField = "stateId";
                    DropDownList3.DataBind();
                    DropDownList1.DataSource = db.cities;
                    DropDownList1.DataTextField = "cityname";
                    DropDownList1.DataValueField = "cityId";
                    DropDownList1.DataBind();

                    TextBox2.Text = q.c_phone_no.ToString();
                    TextBox3.Text = q.c_address;
                    DropDownList1.SelectedValue = q.c_city;
                    DropDownList2.SelectedValue = q.c_country;
                    DropDownList3.SelectedValue = q.c_state;
                    TextBox5.Text = q.c_pincode.ToString();
                }
            }
            else
            {
                Response.Redirect("~/user/login.aspx");
            }                                 
        }
              
        protected void Button2_Click(object sender, EventArgs e)
        {
                Panel1.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
           
            userlinqDataContext db = new userlinqDataContext();

            var query =  db.customers.FirstOrDefault(s => s.c_uname == Session["user"].ToString());
            var q=(from i in db.GetTable<customer>()
              where i.c_id == query.c_id
              select i).Single<customer>();

            
            foreach (order ord in q.orders)
            {
                db.GetTable<order>().DeleteOnSubmit(ord);

                foreach (payment od in ord.payments)
                {
                    db.GetTable<payment>().DeleteOnSubmit(od);
                }
            }
            foreach(feedback f in q.feedbacks)
            {
                db.GetTable<feedback>().DeleteOnSubmit(f);
            }
            db.GetTable<customer>().DeleteOnSubmit(q);


            db.SubmitChanges();
            Session.Abandon();
            Response.Redirect("~/user/home.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("updateuserdetail.aspx");
        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (Page.IsValid)
            {
              
                userlinqDataContext db = new userlinqDataContext();
                customer c = db.customers.FirstOrDefault(i => i.c_uname == Session["user"].ToString());


                c.c_phone_no = Convert.ToInt64(TextBox2.Text);
                c.c_address = TextBox3.Text;
                c.c_country = DropDownList2.SelectedItem.Text;
                c.c_city = DropDownList1.SelectedItem.Text;
                c.c_state = DropDownList3.SelectedItem.Text;
                c.c_pincode = Convert.ToInt32(TextBox5.Text);

                db.SubmitChanges();
               
                Label3.Text = "update details successfully";

            }
           
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length == 10)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            userlinqDataContext db = new userlinqDataContext();
            var q = db.customers.FirstOrDefault(i => i.c_uname == Session["user"].ToString());
            if(Convert.ToInt64(TextBox2.Text)==q.c_phone_no)
            {
                args.IsValid = true;
            }
            else
            {
                if (db.customers.Count((a) => a.c_phone_no == Convert.ToInt64(args.Value)) == 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (args.Value.Length == 6)
            {
                args.IsValid = true;

            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int cId = Convert.ToInt32(DropDownList2.SelectedValue);

            userlinqDataContext db = new userlinqDataContext();

            var q = from x in db.states
                    where x.countryId == cId
                    select x;
            DropDownList3.DataSource = q;
            DropDownList3.DataTextField = "statename";
            DropDownList3.DataValueField = "stateId";
            DropDownList3.DataBind();
           


        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sId = Convert.ToInt32(DropDownList3.SelectedValue);

            userlinqDataContext db = new userlinqDataContext();

            var q = from x in db.cities
                    where x.stateId == sId
                    select x;

            DropDownList1.DataSource = q;
            DropDownList1.DataTextField = "cityname";
            DropDownList1.DataValueField = "cityId";
            DropDownList1.DataBind();
            

        }
    }
}