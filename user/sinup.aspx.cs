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

public partial class user_sinup : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = false;
        error.Visible = false;
        invalidEmail.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        Response.Write("test");
        SqlCommand cmd1 = new SqlCommand("select * from customer_login where email='" + email.Text + "'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd1);
        DataTable dt = new DataTable();
        int result = sda.Fill(dt);
        con.Close();
        Response.Write(result);
        if (result == 1)
        {
            invalidEmail.Visible = true;
            invalidEmail.Text = email.Text + " Already in use ";
        }
        else
        {
            if (confirm_password.Text == password.Text)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                sendcode();
            }
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
        msg.Body = "<center> Welcome To My Toy Shop</center><br />" + "Your Activation code is :- <b>" + activationcode + "</b>." + "<br />Thank You for being with us.";
        msg.IsBodyHtml = true;
        String toaddress = email.Text;
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
        if (Session["code"].ToString() == code.Text)
        {
            con.Open();
            string pass = confirm_password.Text;
            try
            {
                SqlCommand cmd = new SqlCommand("insert into customer_login (ufname,phone,email,password,ulname) values ('" + fname.Text + "','" + mobile.Text + "','" + email.Text + "','" + confirm_password.Text + "','" + lname.Text + "');", con);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result == 1)
                {
                    Response.Write("Submit");
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            Panel3.Visible = true;
            Session.Remove("code");
            Session.Clear();
        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            error.Visible = true;
        }
    }
}