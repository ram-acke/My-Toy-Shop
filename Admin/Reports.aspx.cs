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

public partial class Admin_Reports : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        repo.Visible = false;
    }

    void load_reports()
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("select sum(total_amount) As total from order_details,orders where order_details.order_id=orders.order_id and order_details.status='Delivered' and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        int result = da1.Fill(dt1);
        SqlDataReader reader = cmd1.ExecuteReader();
        if (result==1)
        {
            while (reader.Read())
            {
                sales.Text = Convert.ToString(reader["total"]);
            }
        }
        reader.Close();
        con.Close();
        //order
        con.Open();
        SqlCommand cmd2 = new SqlCommand("select COUNT(*) As ord from order_details,orders where order_details.order_id=orders.order_id and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataTable dt2 = new DataTable();
        int result2 = da2.Fill(dt2);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        if (result2 == 1)
        {
            while (reader2.Read())
            {
                orders.Text = Convert.ToString(reader2["ord"]);
            }
        }
        reader.Close();
        con.Close();

        //pending
        con.Open();
        SqlCommand cmd3 = new SqlCommand("select COUNT(*) As pen from order_details where status='Pending' and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        int result3 = da3.Fill(dt3);
        SqlDataReader reader3 = cmd3.ExecuteReader();
        if (result3 == 1)
        {
            while (reader3.Read())
            {
                PendingOrder.Text = Convert.ToString(reader3["pen"]);
            }
        }
        reader.Close();
        con.Close();

        //delivered
        con.Open();
        SqlCommand cmd4 = new SqlCommand("select COUNT(*) As deli from order_details where status='Delivered' and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
        DataTable dt4 = new DataTable();
        int result4 = da4.Fill(dt4);
        SqlDataReader reader4 = cmd4.ExecuteReader();
        if (result4 == 1)
        {
            while (reader4.Read())
            {
                DeliveredOrder.Text = Convert.ToString(reader4["deli"]);
            }
        }
        reader.Close();
        con.Close();

        //cancel
        con.Open();
        SqlCommand cmd5 = new SqlCommand("select COUNT(*) As cancelO from order_details where status='Order Cancel' and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
        DataTable dt5 = new DataTable();
        int result5 = da5.Fill(dt5);
        SqlDataReader reader5 = cmd5.ExecuteReader();
        if (result5 == 1)
        {
            while (reader5.Read())
            {
                CancelOrder.Text = Convert.ToString(reader5["cancelO"]);
            }
        }
        reader.Close();
        con.Close();

        //online
        con.Open();
        SqlCommand cmd6 = new SqlCommand("select COUNT(*) As cod from order_details where payment_mode='COD' and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da6 = new SqlDataAdapter(cmd6);
        DataTable dt6 = new DataTable();
        int result6 = da6.Fill(dt6);
        SqlDataReader reader6 = cmd6.ExecuteReader();
        if (result6 == 1)
        {
            while (reader6.Read())
            {
                Online.Text = Convert.ToString(reader6["cod"]);
            }
        }
        reader.Close();
        con.Close();

        //cod
        con.Open();
        SqlCommand cmd7 = new SqlCommand("select COUNT(*) As online from order_details where payment_mode='Online' and order_details.order_date between '" + startDate.Text + "' and '" + endDate.Text + "'", con);
        SqlDataAdapter da7 = new SqlDataAdapter(cmd7);
        DataTable dt7 = new DataTable();
        int result7 = da7.Fill(dt7);
        SqlDataReader reader7 = cmd7.ExecuteReader();
        if (result7 == 1)
        {
            while (reader7.Read())
            {
                COD.Text = Convert.ToString(reader7["online"]);
            }
        }
        reader.Close();
        con.Close();
        
    }
    private void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        repo.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        pdfDoc.NewPage();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        exportpdf();
    }
    protected void search_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select orders.product_id,products.product_name,products.product_image,products.product_price,SUM(orders.quantity) as qty from orders,products,order_details where orders.product_id=products.product_id and order_details.order_id=orders.order_id and order_details.status='Delivered' and order_details.order_date Between '" + startDate.Text + "' and '" + endDate.Text + "' Group By orders.product_id,products.product_name,products.product_image,products.product_price Having COUNT(*)>0", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        load_reports();
        repo.Visible = true;
    }
}