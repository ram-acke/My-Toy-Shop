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

public partial class user_Account_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            load_details();
        }

    }
    void load_details()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from customer_login where id='"+Session["UID"]+"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                eMail.Text = reader["email"].ToString();
                fname.Text = reader["ufname"].ToString();
                lname.Text = reader["ulname"].ToString();
                phone.Text = reader["phone"].ToString();
                Street.Text = reader["street"].ToString();
                upincode.Text = reader["upincode"].ToString();
                showMail.Text = reader["email"].ToString();
                Display_name.Text = reader["ufname"].ToString() +" "+ reader["ulname"].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }
    protected void update_Click(object sender, EventArgs e)
    {
        con.Open();
        try
        {
            SqlCommand cmd1 = new SqlCommand("update customer_login set ufname='" + fname.Text + "',ulname='" + lname.Text + "',street='" + Street.Text + "',upincode='" + upincode.Text + "' where id='" + Session["UID"] + "'", con);
            int result = cmd1.ExecuteNonQuery();
            con.Close();
            if (result==1)
            {
                load_details();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
     
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("change.aspx");
    }
}