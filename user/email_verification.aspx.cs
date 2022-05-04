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

public partial class user_email_verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int user_id = 1005;
        //Date 
        DateTime dd = DateTime.Now;
        string _date = dd.ToString("dd/MM");
        string date = Regex.Replace(_date, @"[^\w\d]", "");
        //Time
        String _time = System.DateTime.Now.ToString("mm :ss");
        string time = Regex.Replace(_time, @"[^\w\d]", "");

        //order_details...
        long order_id = long.Parse(time + user_id);
        Response.Write("Time :- "+time);
        Response.Write("<br>");
        Response.Write("Date :- "+date);
        Response.Write("<br>");
        Response.Write(order_id);
    }
}