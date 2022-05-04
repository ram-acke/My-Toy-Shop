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
public partial class Admin_order_list : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
 
    protected void Page_Load(object sender, EventArgs e)
    {
        showing_order();
        delivered_order();
        cancel_order();
    }
    void showing_order()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from order_details,orders,products where orders.order_id=order_details.order_id and products.product_id=orders.product_id and order_details.status='Pending' order by order_details.status DESC", con);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        int result = da.Fill(dt);
        showPendingOrders.DataSource = dt;
        showPendingOrders.DataBind();
        if (result==0)
        {
            PO.Visible = true;
        }
        con.Close();
    }

    void delivered_order()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from order_details,orders,products where orders.order_id=order_details.order_id and products.product_id=orders.product_id and order_details.status='Delivered' order by order_details.status DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        showDeliveredOrders.DataSource = dt;
        showDeliveredOrders.DataBind();
        con.Close();
    }

    void cancel_order()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from order_details,orders,products where orders.order_id=order_details.order_id and products.product_id=orders.product_id and order_details.status='Order Cancel' order by order_details.status DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        showCancelOrders.DataSource = dt;
        showCancelOrders.DataBind();
        con.Close();
    }
    protected void cancelOrder_Click(object sender, EventArgs e)
    {
        cancel.Visible = true;
        pending.Visible = false;
        delivered.Visible = false;
    }
    protected void pendingOrders_Click(object sender, EventArgs e)
    {
        cancel.Visible = false;
        pending.Visible = true;
        delivered.Visible = false;
    }
    protected void deliveredOrders_Click(object sender, EventArgs e)
    {
        cancel.Visible = false;
        pending.Visible = false;
        delivered.Visible = true;
    }
}