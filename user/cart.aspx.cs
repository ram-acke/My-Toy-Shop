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

public partial class user_cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int cid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        showing_product();
        cart_empty.Visible = true;
    }
    void showing_product()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from user_Cart,products where user_id='"+Session["UID"]+"' and products.product_id=user_Cart.product_id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            int result = da.Fill(dt);
            Repeter_cart.DataSource = dt;
            Repeter_cart.DataBind();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cid = Convert.ToInt32(reader["cid"]);
            }
            string Delivery_charge = "70";
            if (dt.Rows.Count > 0)
            {
                cart_empty.Visible = false;
                string Total = dt.Compute("Sum(total_amount)", "").ToString();
                spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                //spanDeliveryCharge.InnerText = "+ Rs. " + Delivery_charge + ".00";
                spanDeliveryCharge.InnerText = "+ Rs."+Delivery_charge+".00";
                string amount = Convert.ToString(Convert.ToInt32(Total) + Convert.ToInt32(Delivery_charge));
                spanTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(amount)) + ".00";
            }
            else
            {
                cart_empty.Text = "Your Shopping Cart is Empty. "+"<a href="+"index.aspx"+">Continue to Shopping</a>";
                divAmountSect.Visible = false;
            }
            con.Close();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void Repeter_cart_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        int uid = Convert.ToInt32(Session["UID"]);
        if (e.CommandName=="removeThisItem")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from user_cart where cid='" + e.CommandArgument + "' and user_id='"+uid+"'",con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
       

        if (e.CommandName=="qtyIncrement")
        {
            con.Open();
            SqlCommand qtycmd = new SqlCommand("select quantity from user_Cart where cid='" + e.CommandArgument + "' and user_id='" + uid + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(qtycmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader reader = qtycmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                int qty = Convert.ToInt32(reader["quantity"].ToString());
                reader.Close();
                if (qty != 10)
                {
                    SqlCommand plusCmd = new SqlCommand("update user_cart set quantity=quantity+1 where cid='" + e.CommandArgument + "' and user_id='" + uid + "'", con);
                    plusCmd.ExecuteNonQuery();
                }
            }
            con.Close();

        }
        if (e.CommandName=="qtyDecrement")
        {
            con.Open();
            SqlCommand qtycmd1 = new SqlCommand("select quantity from user_Cart where cid='" + e.CommandArgument + "' and user_id='" + uid + "'", con);
            SqlDataAdapter da1 = new SqlDataAdapter(qtycmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            SqlDataReader reader1 = qtycmd1.ExecuteReader();
            if (reader1.HasRows)
            {
                reader1.Read();
                int qty = Convert.ToInt32(reader1["quantity"]);
                reader1.Close();
                if (qty != 1)
                {
                    SqlCommand minusCmd = new SqlCommand("update user_cart set quantity=quantity-1 where cid='" + e.CommandArgument + "' and user_id='" + uid + "'", con);
                    minusCmd.ExecuteNonQuery();
                }
            }
            con.Close();
        }
        con.Close();
        showing_product();
    }
    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx?ci="+cid);
    }


}