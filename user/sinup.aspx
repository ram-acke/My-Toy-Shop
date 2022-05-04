<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="sinup.aspx.cs" Inherits="user_sinup" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" runat="Server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #999;
            font-family: 'Roboto', sans-serif;
        }

        .form-control {
            border-color: #eee;
            min-height: 41px;
            box-shadow: none !important;
        }

            .form-control:focus {
                border-color: #5cd3b4;
            }

        .form-control, .btn {
            border-radius: 3px;
        }

        .signup-form {
            width: 500px;
            margin: 0 auto;
            padding: 30px 0;
        }

            .signup-form h2 {
                color: #333;
                margin: 0 0 30px 0;
                display: inline-block;
                padding: 0 30px 10px 0;
                border-bottom: 3px solid #5cd3b4;
            }

            .signup-form form {
                color: #999;
                border-radius: 3px;
                margin-bottom: 15px;
                background: #fff;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }

            .signup-form .form-group row {
                margin-bottom: 20px;
            }

            .signup-form label {
                font-weight: normal;
                font-size: 14px;
                line-height: 2;
            }

            .signup-form input[type="checkbox"] {
                position: relative;
                top: 1px;
            }

            .signup-form .btn {
                font-size: 16px;
                font-weight: bold;
                background: #5cd3b4;
                border: none;
                margin-top: 20px;
                min-width: 140px;
            }

                .signup-form .btn:hover, .signup-form .btn:focus {
                    background: #41cba9;
                    outline: none !important;
                }

            .signup-form a {
                color: #5cd3b4;
                text-decoration: underline;
            }

                .signup-form a:hover {
                    text-decoration: none;
                }

            .signup-form form a {
                color: #5cd3b4;
                text-decoration: none;
            }

                .signup-form form a:hover {
                    text-decoration: underline;
                }

        /*Email Verfication*/
        .main-content {
            width: 50%;
            border-radius: 20px;
            box-shadow: 0 5px 5px rgba(0,0,0,.4);
            margin: 5em auto;
            display: flex;
        }

        .company__info {
            background-color: #008080;
          border-top-left-radius: 247px;
            border-bottom-left-radius: 270px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #fff;
        }

        .fa-android {
            font-size: 3em;
        }

        @media screen and (max-width: 640px) {
            .main-content {
                width: 90%;
            }

            .company__info {
                display: none;
            }

            .login_form {
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;
            }
        }

        @media screen and (min-width: 642px) and (max-width:800px) {
            .main-content {
                width: 70%;
            }
        }

        .row > h2 {
            color: #008080;
        }

        .login_form {
            background-color: #fff;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top: 1px solid #ccc;
            border-right: 1px solid #ccc;
        }

        form {
            padding: 0 2em;
        }

        .form__input {
            width: 30%;
            border: 0px solid transparent;
            border-radius: 0;
            border-bottom: 1px solid #aaa;
            padding: 1em .5em .5em;
            padding-left: 3em;
            outline: none;
            margin: 1.5em auto;
            transition: all .5s ease;
        }

            .form__input:focus {
                border-bottom-color: #008080;
                box-shadow: 0 0 5px rgba(0,80,80,.4);
                border-radius: 4px;
            }

        .btn {
            transition: all .5s ease;
            width: 30%;
            border-radius: 30px;
            color: #008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }

            .btn:hover, .btn:focus {
                background-color: #008080;
                color: #fff;
            }

        .checkmark__circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: #7ac142;
            fill: none;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }

        .checkmark {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            display: block;
            stroke-width: 2;
            stroke: #fff;
            stroke-miterlimit: 10;
            margin: 10% auto;
            box-shadow: inset 0px 0px 0px #7ac142;
            animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s both;
        }

        .checkmark__check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
        }

        @keyframes stroke {
            100% {
                stroke-dashoffset: 0;
            }
        }

        @keyframes scale {

            0%, 100% {
                transform: none;
            }

            50% {
                transform: scale3d(1.1, 1.1, 1);
            }
        }

        @keyframes fill {
            100% {
                box-shadow: inset 0px 0px 0px 30px #7ac142;
            }
        }
        .form-group{
            margin-bottom:0px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="background-color: #2a29832e">
        <asp:Panel ID="Panel1" runat="server">
            <div class="signup-form">
                <div class="row">
                    <div class="col-8 offset-4" style="margin-bottom: -25px;">
                        <h2>Sign Up</h2>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">First Name</label>
                    <div class="col-8">
                        <asp:TextBox ID="fname" class="form-control" name="fname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Last Name</label>
                    <div class="col-8">
                        <asp:TextBox ID="lname" class="form-control" name="lname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Phone No.</label>
                    <div class="col-8">
                        <asp:TextBox ID="mobile" class="form-control"  name="mobile" runat="server" MaxLength="10" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobile" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="mobile" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{10}">Invalid Phone No.</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Email Address</label>
                    <div class="col-8">
                        <asp:TextBox ID="email" class="form-control" name="email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid email adrress</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Password</label>
                    <div class="col-8">
                        <asp:TextBox ID="password" class="form-control" name="password" runat="server" TextMode="Password"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-4">Confirm Password</label>
                    <div class="col-8">
                        <asp:TextBox ID="confirm_password" class="form-control" name="confirm_password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="confirm_password" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-8 offset-4">
                        <p>
                            <label class="form-check-label">
                                <input type="checkbox" required="required">
                                I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label>
                        </p>
                        <p>
                            <asp:Label ID="invalidEmail" runat="server" Text="" ForeColor="Red" Font-Bold="True"></asp:Label></p>
                        <asp:Button ID="Button1" class="btn btn-primary btn-lg" runat="server" Text="Button" OnClick="Button1_Click" />
                    </div>
                </div>
                <div class="text-center">Already have an account? <a href="login.aspx">Login here</a></div>
            </div>
        </asp:Panel>


    </div>
    <%--Email Verification Panel--%>
    <asp:Panel ID="Panel2" runat="server">
        <div class="container-fluid">
            <div class="row main-content bg-success text-center">
                <div class="col-md-4 text-center company__info">
                    
                </div>
                <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
                    <div class="container-fluid">
                        <div class="row">
                            <h2>Email Verfication</h2>
                        </div>
                        <div class="row">
                            <div class="row">
                                <asp:TextBox ID="code" class="form__input" placeholder="Enter Code" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="code" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                            <asp:Label ID="error" runat="server" Text="Invaild Code..!" ForeColor="Red"></asp:Label>
                            <div class="row">
                                <asp:Button ID="Verfied" runat="server" class="btn" Text="Verify" OnClick="Verfied_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>


    <asp:Panel ID="Panel3" runat="server">
        <div class="container-fluid">
            <div class="row main-content bg-success text-center">
                <div class="col-md-4 text-center company__info">
                    
                </div>
                <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
                    <div class="container-fluid">
                        <div class="row">
                            <h2>Account Verified</h2>
                        </div>
                        <div class="row">
                            <div class="wrapper">
                                <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                                    <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                                    <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                                </svg>
                            </div>
                            <div class="row">
                                <a href="login.aspx" class="btn">Login Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

