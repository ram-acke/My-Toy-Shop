using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;

public partial class user_checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    long order_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"]==null)
        {
            Response.Redirect("login.aspx");
        }
        showing_product();
    }
    void showing_product()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select SUM(total_amount) As Cart_total from user_Cart where user_id='" + Session["UID"] + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                total_payment.Text = Convert.ToString(Convert.ToInt32(reader["Cart_total"])+70);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }
    protected void place_order_Click(object sender, EventArgs e)
    {
        string Mop = payment_mode.SelectedItem.Text;
        if (Mop == "COD" )
        {
            ordering();
        }
        if (Mop == "Online")
        {
            Session["mailID"] = mailID.Text;
            Session["Mnumber"] = Mnumber.Text;
            Session["Address1"] = Address1.Text;
            Session["City"] = City.Text;
            Session["State"] = State.Text;
            Session["Mop"] = Mop;
            Session["PinCode"] = PinCode.Text;
            Session["mailID"] = mailID.Text;
            Session["Fname"] = Fname.Text;
            Session["Lname"] = Lname.Text;
            Session["total_payment"] = total_payment.Text;
            Response.Redirect("payment.aspx");
        }
    }

    void ordering()
    {
        int result = 0;
        int user_id = Convert.ToInt32(Session["UID"]);
        string Mop = payment_mode.SelectedItem.Text;
        var dateTime = DateTime.Today.AddDays(2);
        var delivery_DATE = dateTime.ToLongDateString();
        DateTime dd = DateTime.Now;
        string _date = dd.ToString("dd/MM/yy");
        string date = Regex.Replace(_date, @"[^\w\d]", "");
        //Time
        String _time = System.DateTime.Now.ToString("mm :ss");
        //String _time = System.DateTime.Now.ToString("hh : mm :ss");
        string time = Regex.Replace(_time, @"[^\w\d]", "");

        //order_details...
        order_id = long.Parse(time + user_id);
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into order_details (order_id,user_id,email,mobile_no,address,pincode,fname,lname,city,state,payment_mode,EDD,Total_Payment) values('" + order_id + "','" + user_id + "','" + mailID.Text + "','" + Mnumber.Text + "','" + Address1.Text + "','" + PinCode.Text + "','" + Fname.Text + "','" + Lname.Text + "','" + City.Text + "','" + State.Text + "','" + Mop + "','"+delivery_DATE+"','"+total_payment.Text+"')", con);
            result = cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("insert into orders (order_id,user_id,product_id,pprice,quantity) select '"+order_id+"',user_id,product_id,pprice,quantity from user_Cart where user_id='"+Session["UID"]+"'", con);
            cmd1.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("delete from user_Cart where user_id='" + Session["UID"] + "'", con);
            cmd2.ExecuteNonQuery();
            if (result == 1)
            {
                sendcode();
                Response.Redirect("MyOrders.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write("sql error" + ex.Message);
        }
        con.Close();
    }

    private void sendcode()
    {
        Random random = new Random();
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("jrs.couriertracking@gmail.com", "JRS.couriertracking@");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Order Confirmation From My Toy Shop";
        msg.Body = "<center> Welcome To My Toy Shop</center><br />" + "Your Order Id is :- <b>" + order_id + "</b>." + "<br />Thank You for being with us.";
        msg.IsBodyHtml = true;
        String toaddress = mailID.Text;
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
}

