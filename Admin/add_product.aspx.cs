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

public partial class Admin_add_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int result = 0;
        error_alert.Visible = false;
        success_alert.Visible = false;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        product_image.SaveAs(Server.MapPath(@"..\product_image\") + Path.GetFileName(product_image.FileName));
        string img_loc = @"..\product_image\" + Path.GetFileName(product_image.FileName);
        try
        {
            SqlCommand cmd = new SqlCommand("insert into products(product_id,product_name,product_description,product_price,product_image) values('" + product_id.Text + "','" + product_name.Text + "','" + Convert.ToString(product_description.Text) + "','" + product_price.Text + "','" + img_loc + "')", con);
            result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                success_alert.Visible = true;
            }
        }
        catch (Exception ex)
        {
            if (result == 0)
            {
                //Response.Write(ex.Message);
                error_alert.Visible = true;
            }
        }

        con.Close();

    }
}