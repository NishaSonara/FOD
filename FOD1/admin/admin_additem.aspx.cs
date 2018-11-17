using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using System.Data;
using System.Configuration;
using System.IO;
namespace food_ordering_system.admin
{
    public partial class additem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"]!=null)
            {
                if (!IsPostBack)
                {
                   Label1.Visible = false;
                }

            }
            else
            {
                Response.Redirect("~/admin/admin_login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedfile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedfile.FileName);
            string ext = Path.GetExtension(filename);
            
            if (Page.IsValid)
                {
                    adminlinqDataContext db = new adminlinqDataContext();
                    item i = new item();

                i.i_image = filename;

                    //Stream stream = postedfile.InputStream;
                    //BinaryReader binaryreader = new BinaryReader(stream);
                    //byte[] bytes =binaryreader.ReadBytes((int)stream.Length);

                    //i.i_no = Convert.ToInt32(TextBox1.Text);
                    i.i_name = TextBox2.Text;
                    i.i_details = TextBox3.Text;
                    i.i_price = Convert.ToInt32(TextBox4.Text);
                    i.i_status = DropDownList1.SelectedValue;
                    i.i_disc = Convert.ToDecimal(TextBox5.Text);
                    db.items.InsertOnSubmit(i);
                    db.SubmitChanges();

                    string s = "added item successfully!";
                    Response.Redirect("admin_item.aspx?val=" + s);

                }

            }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            HttpPostedFile postedfile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedfile.FileName);
            string ext = Path.GetExtension(filename);
            if(ext==".jpg" || ext==".png" || ext==".jpeg" || ext==".gif" || ext==".tif")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }

       
    }
