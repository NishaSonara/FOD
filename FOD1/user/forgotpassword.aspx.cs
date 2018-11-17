using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
namespace food_ordering_system.user
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]!=null)
            {
                Session.Abandon();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            userlinqDataContext db = new userlinqDataContext();

            var query = db.customers.Where(s => s.c_uname == TextBox3.Text && s.c_email == TextBox1.Text) ;
            if (!query.Any())
            {
                Label1.Text = "invalid details";
            }
            else
            {

                var pwd = db.customers.SingleOrDefault(s => s.c_uname == TextBox3.Text && s.c_email == TextBox1.Text);
                string pass = pwd.c_password;
               
                if (Page.IsValid)
                {
                    if (!string.IsNullOrEmpty(TextBox1.Text))
                    {
                        try {
                            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential("bhoomi.vaghasiya12@gmail.com", "bhoomikat");
                            MailMessage msg = new MailMessage("bhoomi.vaghasiya12@gmail.com", TextBox1.Text);

                            msg.Subject = "Password Recovery";
                            msg.Body = "Your password of delicious pizza account is: " + pass;
                            msg.IsBodyHtml = true;
                            smtp.EnableSsl = true;
                            smtp.Send(msg);

                            Label1.ForeColor = System.Drawing.Color.Blue;
                            Label1.Text = "Password has been sent to your email!";
                        }
                        catch(WebException ex)
                        {
                            
                            
                        }
                }

                }
                }
            }
        }

        
}
