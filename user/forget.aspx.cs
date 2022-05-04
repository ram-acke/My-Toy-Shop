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
using System.Net.Mail;
using System.Net;
public partial class user_forget : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
    }
    protected void forget_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from customer_login where email='" + uID.Text + "'", con);
            cmd.ExecuteNonQuery();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            int result = sda.Fill(dt);
            con.Close();
            if (result == 1)
            {
                Session["email"] = uID.Text;
                Panel2.Visible = true;
                Panel1.Visible = false;
                sendcode();
            }
            else
            {
                userIDerror.Visible = true;
            }
        }
        catch (Exception)
        {
        }
    }

    private void sendcode()
    {
        Random random = new Random();
        string activationcode = random.Next(1000, 9999).ToString();
        Session["code"] = activationcode;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("jrs.couriertracking@gmail.com", "JRS.couriertracking@");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Activation Code To Verify Email Address";
        msg.Body = "<center> Welcome To My Toy Shop</center><br />" + "Your Password Reset code is :- <b>" + activationcode + "</b>." + "<br />Thank You for being with us.";
        msg.IsBodyHtml = true;
        String toaddress = uID.Text;
        msg.To.Add(toaddress);
        String fromaddress = "My Toy Shop <jrs.couriertracking@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
    protected void Verfied_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update customer_login set password='" + cnew.Text + "' where email='" + Session["email"] + "'", con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                Panel3.Visible = false;
                Panel4.Visible = true;
                Session.Remove("code");
                Session.Clear();
            }
        }
        catch (Exception)
        {
        }
    }
    protected void checkCODE_Click(object sender, EventArgs e)
    {
        if (Session["code"].ToString() == code.Text)
        {
            Panel3.Visible = true;
            Panel2.Visible = false;
        }
        else
        {
            Panel2.Visible = true;
            codeError.Visible = true;
        }
    }
}