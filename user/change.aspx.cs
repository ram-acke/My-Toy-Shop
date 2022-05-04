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

public partial class user_change : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        Panel3.Visible = false;
        passError.Visible = false;
    }

    void change_password()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("update customer_login set password='" + cnew.Text + "' where id='" + Session["UID"] + "' and password='"+old.Text+"'", con);
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                Panel3.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                passError.Visible = true;
            }
        }
        catch (Exception)
        {
        }
        con.Close();
    }
    protected void Verfied_Click(object sender, EventArgs e)
    {
        change_password();
    }
}