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

public partial class user_login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_bt_Click(object sender, EventArgs e)
    {
        con.Open();
        string query = "select * from customer_login where email='" + userid.Text + "' and password='" + pass.Text + "'";
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
                string name = Convert.ToString(reader["ufname"]);
                string email = Convert.ToString(reader["email"]);
                //string id = Convert.ToString(reader["Id"]);
                string id = reader["Id"].ToString();
                Session["name"] = name;
                Session["email"] = email;
                Session["UID"] = id;
                Response.Redirect("index.aspx");

            }
        }
        else
        {
            login_message.Visible = true;
        }
        con.Close();
    }
}