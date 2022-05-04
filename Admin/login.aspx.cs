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

public partial class Admin_Admin_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_Click(object sender, EventArgs e)
    {
        con.Open();
        string query = "select * from Admin where adminID='" + adminId.Text + "' and adminPass='" + pass.Text + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        int result = sda.Fill(dt);
        SqlDataReader reader = cmd.ExecuteReader();

        if (result == 1)
        {
            while (reader.Read())
            {
                //Response.Write("Data : " + reader["ufname"]);
                string name = Convert.ToString(reader["Name"]);
                string ADI = Convert.ToString(reader["adminID"]);
                Session["Adminname"] = name;
                Session["ADI"] = ADI;
                Response.Redirect("add_product.aspx");

            }
        }
        else
        {
            login_message.Visible = true;
        }
        con.Close();
    }
}