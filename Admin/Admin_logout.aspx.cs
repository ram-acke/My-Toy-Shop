using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null && Session["ADI"] != null)
        {
            Session.Remove("name");
            Session.Remove("email");
            Session.Clear();
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
}