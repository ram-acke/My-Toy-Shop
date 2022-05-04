using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class Invoice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        showing_product();
    }

    void showing_product()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from order_details,products,orders where order_details.user_id='" + Session["UID"] + "' and orders.order_id='" + Request.QueryString["invoice"] + "' and products.product_id=orders.product_id and order_details.order_id=orders.order_id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            int result = da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            if (result >= 1)
            {
                while (reader.Read())
                {
                    string oi = Convert.ToString(reader["order_id"]);
                    string fname = Convert.ToString(reader["fname"]);
                    string lname = Convert.ToString(reader["lname"]);
                    string addre = Convert.ToString(reader["address"]);
                    string total = Convert.ToString(reader["total_amount"]);
                    string payment_mode = Convert.ToString(reader["payment_mode"]);
                    string email = Convert.ToString(reader["email"]);
                    string mobile_no = Convert.ToString(reader["mobile_no"]);
                    string pincode = Convert.ToString(reader["pincode"]);
                    string Odate = Convert.ToString(reader["order_date"]);
                    order_id.Text = oi;
                    address.Text = addre;
                    modeOFpayment.Text = payment_mode;
                    mail.Text = email;
                    mobile.Text = mobile_no;
                    pin.Text = pincode;
                    gtotal.Text = total;
                    order_date.Text = Odate;
                    name.Text = fname + " " + lname;
                }
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        exportpdf();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }




}