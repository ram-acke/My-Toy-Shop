<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="checkout.aspx.cs" Inherits="user_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" runat="Server">
    <%--<link href="css/style.css" rel="stylesheet">--%>
    <!-- Google Web Fonts -->
    <%--    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

       <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>--%>
    <style>
        body {
            background-color: #F5F5F5;
        }
        .btn.btn-primary {
    background: #3c763d;
    border: 0 none;
    border-radius: 0;
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Checkout Start -->
    <div class="container-fluid" style="margin-left: 100px; margin-right: 100px">
        <div class="row px-xl-5">
            <div class="col-lg-8" style="background-color: white">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <asp:TextBox ID="Fname" class="form-control" placeholder="John" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Fname" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="Lname" class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lname" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <asp:TextBox ID="mailID" class="form-control" placeholder="example@email.com" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mailID" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="mailID" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid Email..</asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <asp:TextBox ID="Mnumber" class="form-control" placeholder="999 999 99" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Mnumber" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mnumber" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{10}">Invalid Mobile Number</asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 1</label>
                            <asp:TextBox ID="Address1" class="form-control" placeholder="123 Street" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Address1" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Pin Code</label>
                            <asp:TextBox ID="PinCode" class="form-control" placeholder="123" runat="server" MaxLength="6"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PinCode" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PinCode" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{6}">Invalid PinCode</asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <asp:TextBox ID="City" Text="Vadodara" disabled="disabled" class="form-control" placeholder="New York" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <asp:TextBox ID="State" Text="Gujrat" disabled="disabled" class="form-control" placeholder="New York" runat="server"></asp:TextBox>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-4" style="background-color: white">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Products</h6>
                        <p class="mb-3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id,product_id1" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                    <asp:BoundField DataField="pprice" HeaderText="pprice" SortExpression="pprice" />
                                    <asp:BoundField DataField="total_amount" HeaderText="total_amount" ReadOnly="True" SortExpression="total_amount" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </p>

                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Delivery Charge</h6>
                            <h6 class="font-weight-medium" runat="server" id="Dcharge">+70</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5 id="paying_amount" runat="server">
                                Paying Amount :- <asp:Label ID="total_payment" runat="server"></asp:Label>
                            </h5>
                        </div>
                    </div>
                </div>
                <br />
                <div class="mb-5">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="payment_mode" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </h5>
                    <div class="bg-light p-30">
                        <asp:RadioButtonList ID="payment_mode" runat="server">
                            <asp:ListItem Text="Online" Value="online" />
                            <asp:ListItem Text="COD" Value="cod" />
                        </asp:RadioButtonList>

                        <asp:Button ID="place_order" class="btn btn-block btn-primary font-weight-bold py-3" runat="server" Text="Place Order" OnClick="place_order_Click" />
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from user_Cart,products where user_Cart.user_id=@user_id and products.product_id=user_Cart.product_id">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1005" Name="user_id" SessionField="UID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    </a>

</asp:Content>


