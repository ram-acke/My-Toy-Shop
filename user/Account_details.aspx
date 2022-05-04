<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="Account_details.aspx.cs" EnableEventValidation="false" Inherits="user_Account_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" runat="Server">
    <style>
        body {
            margin: 0;
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
        }

        .account-settings .user-profile {
            margin: 0 0 1rem 0;
            padding-bottom: 1rem;
            text-align: center;
        }

            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }

                .account-settings .user-profile .user-avatar img {
                    width: 90px;
                    height: 90px;
                    -webkit-border-radius: 100px;
                    -moz-border-radius: 100px;
                    border-radius: 100px;
                }

            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }

            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 20px;
                font-weight: 400;
                color: #9fa8b9;
            }

        .account-settings .about {
            margin: 2rem 0 0 0;
            text-align: center;
        }

            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }

            .account-settings .about p {
                font-size: 20px;
            }

        .form-control {
            border: 1px solid #cfd1d8;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            font-size: 15px;
            background: #ffffff;
            color: #2e323c;
        }

        .card {
            background: #ffffff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }

        .btn.btn-primary {
            background: #007bff;
            border: 0 none;
            border-radius: 0;
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <img src="img/profile_logo.jpg" alt="Maxwell Admin">
                                </div>
                                <h5 class="user-name">
                                    <asp:Label ID="Display_name" runat="server" Text="Label"></asp:Label></h5>
                                <asp:Label ID="showMail" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="about">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><h5>Change Password</h5></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary">Personal Details</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="fname">First Name</label>
                                    <asp:TextBox ID="fname" CssClass="form-control" placeholder="Enter full name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lname">Last Name</label>
                                    <asp:TextBox ID="lname" CssClass="form-control" placeholder="Enter Last Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <asp:TextBox ID="phone" CssClass="form-control" disabled="disabled" placeholder="Enter phone number" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="eMail">Email</label>
                                    <asp:TextBox ID="eMail" CssClass="form-control" disabled="disabled" placeholder="Enter email ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mt-3 mb-2 text-primary">Address</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="Street">Street</label>
                                    <asp:TextBox ID="Street" CssClass="form-control" placeholder="Enter Street" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="upincode">Pin Code</label>
                                    <asp:TextBox ID="upincode" CssClass="form-control" placeholder="Pin Code" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="upincode" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{6}">Incorrect PinCode</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="sTate">State</label>
                                    <asp:TextBox ID="sTate" CssClass="form-control" value="Gujrat" disabled="disabled" placeholder="Enter State" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="ciTy">City</label>
                                    <asp:TextBox ID="ciTy" CssClass="form-control" value="Vadodara" disabled="disabled" placeholder="Enter City" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <a id="goback" name="submit" href="index.aspx" class="btn btn-secondary">Go Back</a>
                                    <asp:Button ID="update" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="update_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

