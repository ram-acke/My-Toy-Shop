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

public partial class user_view : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"]==null)
        {
            Response.Redirect("index.aspx");
        }
        showing_product();
        checking();
       
    }

    void showing_product()
    {
       con.Open();
       try
       {
           SqlCommand cmd = new SqlCommand("select * from products where product_id='" + Request.QueryString["id"] + "'", con);
           SqlDataAdapter da = new SqlDataAdapter(cmd);
           DataTable dt = new DataTable();
           int result = da.Fill(dt);
           SqlDataReader reader = cmd.ExecuteReader();
           if (result == 1)
           {
               while (reader.Read())
               {
                   string Pname = Convert.ToString(reader["product_name"]);
                   string Pprice = Convert.ToString(reader["product_price"]);
                   string Pimage = Convert.ToString(reader["product_image"]);
                   string Pdesc = Convert.ToString(reader["product_description"]);
                   pimage.ImageUrl = Pimage;
                   pname.Text = Pname;
                   pdesc.Text = Pdesc;
                   pprice.Text = Pprice;
               }
               con.Close();
           }
                    
        }
        catch (Exception ex) {
            Response.Write(ex.Message);
        }
    }
 
    protected void add_to_cart_Click(object sender, EventArgs e)
    {
        if (Session["UID"]==null)
        {
            Response.Redirect("login.aspx");
        }
        DateTime dd = DateTime.Now;
        string _date = dd.ToString("dd/MM/yy");
        string date = Regex.Replace(_date, @"[^\w\d]", "");
        //Time
        String _time = System.DateTime.Now.ToString("mm :ss");
        //String _time = System.DateTime.Now.ToString("hh : mm :ss");
        string time = Regex.Replace(_time, @"[^\w\d]", "");

        //order_details...
        int user_id = Convert.ToInt32(Session["UID"]);
        long cart_id = long.Parse(time + user_id);
        int qty = 1;
        int price = int.Parse(pprice.Text);

        con.Open();
        SqlCommand cmd = new SqlCommand("insert into user_Cart(cid,user_id,product_id,quantity,pprice) values('" + cart_id + "','" + Convert.ToInt32(Session["UID"]) + "','" + Convert.ToInt32(Request.QueryString["id"]) + "','" + qty + "','" + price + "')", con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result==1)
        {
            checking();
        }
    }

    void checking()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from user_cart where product_id='"+Request.QueryString["id"]+"' and user_id='"+Session["UID"]+"'",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int count = ds.Tables[0].Rows.Count;
        if (count == 1)
        {
            add_to_cart.Visible = false;
            added.Visible = true;
        }
        else
        {
            add_to_cart.Visible = true;
            added.Visible = false;
        }
        con.Close(); 
    }
}