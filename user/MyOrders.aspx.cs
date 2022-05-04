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

public partial class user_MyOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        showing_product();
        cancel_orders();
        Delivered_order();
    }
    void showing_product()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from orders,order_details,products where orders.user_id = '" + Session["UID"] + "' and order_details.order_id=orders.order_id and products.product_id=orders.product_id and order_details.status='pending'  Order By order_details.order_id ASC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            show_orders.DataSource = dt;
            show_orders.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }

    void Delivered_order()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from orders,order_details,products where orders.user_id = '" + Session["UID"] + "' and order_details.order_id=orders.order_id and products.product_id=orders.product_id and order_details.status='Delivered'  Order By order_details.order_id ASC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            delivered_orders.DataSource = dt;
            delivered_orders.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }
    void cancel_orders()
    {
        con.Open();
        try
        {
            SqlCommand cmd1 = new SqlCommand("select * from orders,order_details,products where orders.user_id = '" + Session["UID"] + "' and order_details.order_id=orders.order_id and products.product_id=orders.product_id and order_details.status='Order Cancel'  Order By order_details.order_id DESC", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);
            order_History.DataSource = dt1;
            order_History.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }
    protected void show_orders_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "cancelOrder")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update order_details set status='Order Cancel' where user_id='" + Session["UID"] + "' and order_id='" + e.CommandArgument + "'", con);
            //Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            con.Close();
            showing_product();
        }

    }

    protected void show(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Hide.Visible = true;
        Show.Visible = false;
    }
    protected void hide(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Hide.Visible = false;
        Show.Visible = true;
    }
    protected void show_orders_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "cancelOrder")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string order_id = commandArgs[0];
            Session["order_id"] = order_id;
            Session["email"] = commandArgs[1];
            con.Open();
            SqlCommand cmd = new SqlCommand("update order_details set status='Order Cancel' where user_id='" + Session["UID"] + "' and order_id='" + order_id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            sendcode();
            showing_product();
        }
    }
    protected void DOrders_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        DOrders.Visible = false;
        Dhide.Visible = true;
    }
    protected void Dhide_Click(object sender, EventArgs e)
    {
        Panel3.Visible = false;
        DOrders.Visible = true;
        Dhide.Visible = false;
    }

    private void sendcode()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("jrs.couriertracking@gmail.com", "JRS.couriertracking@");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Order Cancelled Successfully of -My Toy Shop";
        msg.Body = "<center> Order Cancelled </center><br />" + "Your Cancelled Order Id is :- <b>" + Session["order_id"] + "</b>." + "<br />Thank You for being with us.";
        msg.IsBodyHtml = true;
        String toaddress = Session["email"].ToString();
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
        Session.Remove("email");
        Session.Remove("order_id");
    }
}