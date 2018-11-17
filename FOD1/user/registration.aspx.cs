using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
namespace food_ordering_system.user
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]==null)
            {
                if (!IsPostBack)
                {
                    userlinqDataContext db = new userlinqDataContext();

                    DropDownList1.DataSource = db.countries;
                    DropDownList1.DataTextField = "countryname";
                    DropDownList1.DataValueField = "countryId";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("-select-", "0"));
                    DropDownList2.Items.Insert(0, new ListItem("-select-", "0"));
                    DropDownList3.Items.Insert(0, new ListItem("-select-", "0"));
                    FillCapctha();
                }

            }
            else
            {
                Response.Redirect("~/user/logout.aspx");
            }
           }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int cId = Convert.ToInt32(DropDownList1.SelectedValue);

            userlinqDataContext db = new userlinqDataContext();
            
            var q = from x in db.states
                    where x.countryId == cId
                    select x;
            DropDownList2.DataSource = q;
            DropDownList2.DataTextField = "statename";
            DropDownList2.DataValueField = "stateId";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("-select-", "0"));

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            int sId = Convert.ToInt32(DropDownList2.SelectedValue);

            userlinqDataContext db = new userlinqDataContext();
           
            var q = from x in db.cities
                    where x.stateId == sId
                    select x;

            DropDownList3.DataSource = q;
            DropDownList3.DataTextField = "cityname";
            DropDownList3.DataValueField = "cityId";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("-select-", "0"));

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 8)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        void FillCapctha()

        {

            try

            {

                Random random = new Random();

                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 6; i++)

                captcha.Append(combination[random.Next(combination.Length)]);

                Session["captcha"] = captcha.ToString();

                imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();

            }
            catch
            {
                throw;
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            if (Page.IsValid)
            {
                

               

                userlinqDataContext db = new userlinqDataContext();
                customer c = new customer();
                
                c.c_uname = TextBox1.Text;
                c.c_fname = TextBox11.Text;
                c.c_lname = TextBox12.Text;
                c.c_phone_no = Convert.ToInt64(TextBox2.Text);
                c.c_gender = RadioButtonList1.Text;
                c.c_address = TextBox3.Text;
                c.c_city = DropDownList3.SelectedItem.Text;
                c.c_state = DropDownList2.SelectedItem.Text;
                c.c_country = DropDownList1.SelectedItem.Text;
                c.c_pincode = Convert.ToInt32(TextBox6.Text);
                c.c_email = TextBox7.Text;
                c.c_password = TextBox9.Text;
                c.c_dob = Convert.ToDateTime(TextBox8.Text);

                db.customers.InsertOnSubmit(c);
                Panel1.Visible = true;
                Panel2.Visible = true;
                Label1.Text = "Hey! now you are member of delicious pizza..Enjoy it!";
                db.SubmitChanges();
               
            }
            

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            userlinqDataContext db = new userlinqDataContext();

            if (db.customers.Count((a) => a.c_uname == TextBox1.Text) == 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }

        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            userlinqDataContext db = new userlinqDataContext();


            if (db.customers.Count((a) => a.c_email == TextBox7.Text) == 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }

        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            userlinqDataContext db = new userlinqDataContext();
            if (db.customers.Count((a) => a.c_phone_no == Convert.ToInt64(args.Value)) == 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        
        protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(args.Value.Length==10)
            {
                args.IsValid = true;
                
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator6_ServerValidate(object source, ServerValidateEventArgs args)
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

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
        }

        protected void CustomValidator7_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Session["captcha"].ToString() != args.Value)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
                
            FillCapctha();
        }
    }
}