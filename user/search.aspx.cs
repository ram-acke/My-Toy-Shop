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

public partial class user_search : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        search_products();
    }

    void search_products()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from products where product_description like '"+Request.QueryString["search"]+"%' or product_name like '"+Request.QueryString["search"]+"%'", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        sp1.DataSource = dt;
        sp1.DataBind();
        con.Close();
    }
}