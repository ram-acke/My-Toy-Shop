<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="login.aspx.cs" Inherits="user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section id="form" style="margin-top:10px">
        <!--form-->
        <div class="container" style="background-color:#b2a87e36">
            <div class="row">
                <div class="col-sm-5 col-sm-offset-1">
                    <div class="login-form">
                        <!--login form-->
                        <h2>Login to your account</h2>
                        <asp:TextBox ID="userid" placeholder="User Id"  runat="server" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userid" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="pass" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="userid" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid User Id</asp:RegularExpressionValidator>
                        <br />
                        <br />
                        <asp:Button ID="login_bt" CssClass="btn btn-default" runat="server" Text="Login" OnClick="login_bt_Click" />
                        <asp:Label ID="login_message" runat="server" Visible="false" Text="Invalid Credentials..." ForeColor="Red"></asp:Label>
                        <br />
                        <a href="forget.aspx">Forget Password?</a>
                        <div class="text-center"> Don't have an account yet? <a href="sinup.aspx">Sign-Up</a></div>
                    </div><!--/login form-->
                </div>
            </div>
        </div>
    </section><!--/form-->
</asp:Content>

