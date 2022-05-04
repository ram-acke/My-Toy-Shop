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

public partial class Admin_Modify_product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_details();
        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        con.Open();
        try
        {
            SqlCommand cmd1 = new SqlCommand("update products set product_name='" + pName.Text + "',product_description='" + desc.Text + "',product_price='" + price.Text + "',stock='" + stock.Text + "' where product_id=" + Request.QueryString["pi"] + "", con);
            int result = cmd1.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                load_details();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        Response.Redirect("product_list.aspx");
    }

    void load_details()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from products where product_id='" + Request.QueryString["pi"] + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                pName.Text = reader["product_name"].ToString();
                price.Text = reader["product_price"].ToString();
                stock.Text = reader["stock"].ToString();
                pId.Text = reader["product_id"].ToString();
                desc.Text = reader["product_description"].ToString();
                Image1.ImageUrl = reader["product_image"].ToString();
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

}