using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_logoutAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminname"] != null)
        {
            Session.Remove("Adminname");
            Session.Remove("ADI");
            Session.Clear();
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
}