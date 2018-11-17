using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
namespace food_ordering_system.user
{
    public partial class bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (!IsPostBack)
                {
                    if(Session["total"]!=null)
                    {
                        gridbind();
                    }
                    else
                    {
                        Response.Redirect("~/user/login.aspx");
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
            Label1.Text = Session["total"].ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/user/payment.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=OrderSummary.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
               
               panel1.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();

               
            }  

        catch (Exception ex)  
        {
                Response.Write(ex.Message);
            }
        }
        public  override void VerifyRenderingInServerForm(Control control)
        {

        }

    }
    }
