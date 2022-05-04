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


public partial class Admin_view_order : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    static string Change_status;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showing_product();
        }
    }
    void showing_product()
    {
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from products,orders,order_details,customer_login where orders.order_id='" + Request.QueryString["oi"] + "' and products.product_id=orders.product_id and order_details.order_id=orders.order_id and customer_login.Id=orders.user_id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            int result = da.Fill(dt);
            SqlDataReader reader = cmd.ExecuteReader();
            if (result >= 1)
            {
                while (reader.Read())
                {
                    string Data_Pname = Convert.ToString(reader["product_name"]);
                    string Data_Pprice = Convert.ToString(reader["total_amount"]);
                    string Data_Pimage = Convert.ToString(reader["product_image"]);
                    string Data_addre = Convert.ToString(reader["address"]);
                    //string Data_user_fname = Convert.ToString(reader["name"]);
                    //string Data_user_lname = Convert.ToString(reader["name"]);
                    string Data_sta = Convert.ToString(reader["status"]);
                    string Data_quantity = Convert.ToString(reader["quantity"]);
                    string Data_pmod = reader["payment_mode"].ToString();

                    string Data_mobile_no = Convert.ToString(reader["mobile_no"]);
                    string Data_pincode = Convert.ToString(reader["pincode"]);
                    string Data_fname = Convert.ToString(reader["fname"]);
                    string Data_lname = Convert.ToString(reader["lname"]);
                    string Data_city = Convert.ToString(reader["city"]);
                    string Data_state = Convert.ToString(reader["state"]);
                    string Data_email = Convert.ToString(reader["email"]);
                    string Data_order_id = Convert.ToString(reader["order_id"]);

                    Session["email"] = reader["email"].ToString();

                    pimage.ImageUrl = Data_Pimage;
                    pname.Text = Data_Pname;
                    address.Text = Data_addre;
                    pprice.Text = Data_Pprice;
                    status.Text = Data_sta;
                    qty.Text = Data_quantity;
                    mode.Text = Data_pmod;

                    mail.Text = Data_email;
                    First.Text = Data_fname;
                    Last.Text = Data_lname;
                    mob.Text = Data_mobile_no;
                    pin.Text = Data_pincode;
                    Order_id.Text = Data_order_id;
                    City.Text = Data_city;
                    State.Text = Data_state;
                    mop.Text = Data_pmod;

                    Dname.Text = Data_fname + " " + Data_lname;
                    if (Data_sta == "Pending")
                    {
                        DropDownList1.Items.Clear();
                        DropDownList1.Items.Add("Select");
                        DropDownList1.Items.Add("Pending");
                        DropDownList1.Items.Add("Delivered");
                    }
                    if (Data_sta == "Delivered")
                    {
                        DropDownList1.Items.Clear();
                        DropDownList1.Items.Add("Delivered");
                        DropDownList1.Enabled = false;
                    }

                }
                con.Close();
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("Delivered"))
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("update order_details set status='" + DropDownList1.SelectedValue + "' where order_id='" + Request.QueryString["oi"] + "'", con);
            cmd1.ExecuteNonQuery();
            con.Close();
            sendcode();
            showing_product();
        }
    }

    private void sendcode()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("jrs.couriertracking@gmail.com", "JRS.couriertracking@");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Your Order has been Successfully Delivered by -My Toy Shop";
        msg.Body = "<center> Order Delivered </center><br />" + "Your Order Id is :- <b>" + Request.QueryString["oi"] + "</b>." + "<br />Thank You for being with us.";
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
    }
}

