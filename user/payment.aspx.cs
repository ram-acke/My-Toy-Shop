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


public partial class user_payment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    long txnID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["mailID"] == null)
        //{
        //    Response.Redirect("cart.aspx");
        //}
        show_summary();
    }

    void ordering()
    {
        int result = 0;
        int user_id = Convert.ToInt32(Session["UID"]);
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
        long order_id = long.Parse(time + user_id);
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into order_details (order_id,user_id,email,mobile_no,address,pincode,fname,lname,city,state,payment_mode,EDD,Total_Payment) values('" + order_id + "','" + user_id + "','" + Session["mailID"] + "','" + Session["Mnumber"] + "','" + Session["Address1"] + "','" + Session["PinCode"] + "','" + Session["Fname"] + "','" + Session["Lname"] + "','" + Session["City"] + "','" + Session["State"] + "','" + Session["Mop"] + "','"+delivery_DATE+"','"+Session["total_payment"]+"')", con);
            result = cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("insert into orders (order_id,user_id,product_id,pprice,quantity) select '"+order_id+"',user_id,product_id,pprice,quantity from user_Cart where user_id='" + Session["UID"] + "'", con);
            cmd1.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("delete from user_Cart where user_id='" + Session["UID"] + "'", con);
            cmd2.ExecuteNonQuery();
            if (result == 1)
            {
                SqlCommand cmd3 = new SqlCommand("update Payment_Details set txnStatus='Success' where transaction_id='"+txnID+"'", con);
                cmd3.ExecuteNonQuery();
                sendcode(order_id);
                Session.Remove("mailID");
                Session.Remove("Mnumber");
                Session.Remove("Address1");
                Session.Remove("City");
                Session.Remove("State");
                Session.Remove("Mop");
                Session.Remove("PinCode");
                Session.Remove("mailID");
                Session.Remove("Fname");
                Session.Remove("Lname");
                Session.Remove("total_payment");
                Response.Redirect("MyOrders.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write("sql error" + ex.Message);
        }
        con.Close();
        
    }

    void show_summary()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from user_Cart,products where user_id='" + Session["UID"] + "' and products.product_id=user_Cart.product_id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                PNAME.Text = reader["product_name"].ToString();
                PPRICE.Text = reader["product_price"].ToString();
                total.Text = reader["total_amount"].ToString();
                qty.Text = reader["quantity"].ToString();
                payingAMOUNT.Text = Convert.ToString(Convert.ToInt32(total.Text) + 70);
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }
    protected void cancelPayment_Click(object sender, EventArgs e)
    {
        Session.Remove("mailID");
        Session.Remove("Mnumber");
        Session.Remove("orderID");
        Session.Remove("Address1");
        Session.Remove("City");
        Session.Remove("State");
        Session.Remove("Mop");
        Session.Remove("PinCode");
        Session.Remove("mailID");
        Session.Remove("Fname");
        Session.Remove("Lname");
        Response.Redirect("cart.aspx");
    }
    protected void payNow_Click(object sender, EventArgs e)
    {
        string ExpireDate = ExpireMonth.Text + ExpireYear.Text;
        if (paypal.Text == "")
        {
            paypalERROR.Visible = true;
        }
        else
        {
            paying();
        }
        if (cardNO.Text== "" || ExpireDate== "" || CVV.Text == "")
        {
            Carderror.Visible = true;
        }
        else
        {
            paying();
        }
    }

    void paying()
    {
        string ExpireDate = ExpireMonth.Text + ExpireYear.Text;
        DateTime dd = DateTime.Now;
        string _date = dd.ToString("dd/MM/yy");
        string date = Regex.Replace(_date, @"[^\w\d]", "");
        //Time
        String _time = System.DateTime.Now.ToString("mm :ss");
        //String _time = System.DateTime.Now.ToString("hh : mm :ss");
        string time = Regex.Replace(_time, @"[^\w\d]", "");

        //order_details...
        int user_id = Convert.ToInt32(Session["UID"]);
        txnID = long.Parse(80+user_id + time);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Payment_Details (order_id,transaction_id,paypal_ID,card_no,expire_date,cvv) values('" + Session["orderID"] + "','" + txnID + "','" + paypal.Text + "','" + cardNO.Text + "','" + ExpireDate + "','" + CVV.Text + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ordering();
    }

    private void sendcode(long order_id)
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
        String toaddress = Session["mailID"].ToString();
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