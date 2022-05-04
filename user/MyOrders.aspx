<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="user_MyOrders" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" runat="Server">
    <style>
        .btn.btn-primary {
            background: #0f16fe;
            border: 0 none;
            border-radius: 0;
            margin-top: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container bootdey" style="width: 1220px">
        <div class="col-md-12">
            <%--pending_orders..--%>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Repeater ID="show_orders" runat="server" OnItemCommand="show_orders_ItemCommand1">
                    <ItemTemplate>
                        <div class="panel-body" id="style" style="margin: 5px; background-color: ; border-radius: 30px">
                            <div class="col-md-3">
                                <div class="pro-img-details" style="margin-bottom: 10px">
                                    <asp:Image ID="pimage" ImageUrl='<%#Eval("product_image") %>' runat="server" Height="190px" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <p style="font-size: 10px; margin-bottom: -5px;">2/28/2022 11:45:08 PM</p>
                                <p>
                                    <span>
                                        <asp:Label ID="Label1" runat="server" Text="Order Id :-" Font-Bold="True" Font-Size="Medium"></asp:Label></span>
                                    <span>
                                        <asp:Label ID="Order_id" runat="server" Text='<%#Eval("order_id") %>' Font-Italic="True" ForeColor="Blue"></asp:Label></span>
                                    <br />
                                    <span>Address:-</span>
                                    <br />
                                    <span style="font-size: 20px"><b>
                                        <asp:Label ID="First" runat="server" Text='<%#Eval("fname") %>'></asp:Label>
                                        <asp:Label ID="Last" runat="server" Text='<%#Eval("lname") %>'></asp:Label>
                                    </b>
                                    </span>
                                    <br />
                                    <asp:Label ID="address" runat="server" Text='<%#Eval("address") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                    <br />
                                    Pin Code:
                                <asp:Label ID="pin" runat="server" Text='<%#Eval("pincode") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                    <br />
                                    Mobile:
                                <asp:Label ID="mob" runat="server" Text='<%#Eval("mobile_no") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                    <br />
                                    <asp:Label ID="mail" runat="server" Text='<%#Eval("email") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                    <br />
                                    <asp:Label ID="City" runat="server" Text='<%#Eval("city") %>' Font-Italic="True"></asp:Label>
                                    <asp:Label ID="State" runat="server" Text='<%#Eval("state") %>' Font-Italic="True"></asp:Label>
                                    <br />
                                </p>

                            </div>


                            <div class="col-md-4">

                                <div class="m-bot15">
                                    <asp:Label ID="pname" runat="server" Text='<%#Eval("product_name") %>' Font-Italic="True" ForeColor="Blue"></asp:Label>
                                    X
                            <asp:Label ID="qty" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                                    <br />
                                    <strong>Amount : </strong>
                                    <span class="amount-old">
                                        <asp:Label ID="pprice" runat="server" Text='<%#Eval("total_amount") %>'></asp:Label></span>/
                            <asp:Label ID="mode" runat="server" Text='<%#Eval("payment_mode") %>' ForeColor="Gray"></asp:Label>
                                </div>
                                <p>
                                    <strong>Status : </strong>
                                    <asp:Label ID="status" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                    <strong>Delivery Charges : ₹70</strong>
                                </p>
                                <p>
                                    <strong>Paying Amount : ₹</strong>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Total_Payment") %>'></asp:Label>
                                </p>
                                <p>

                                    <asp:Label ID="Label2" runat="server" Text="Estimate Delivery Date :- " Font-Bold="True" ForeColor="Green"></asp:Label>
                                    <asp:Label ID="EDD" runat="server" Text='<%#Eval("EDD") %>' Font-Bold="True"></asp:Label>


                                </p>
                                <p>
                                    <a target="_blank" class="btn btn-primary" href="Invoice.aspx?invoice=<%#Eval("order_id") %>">Invoice</a>
                                    <asp:LinkButton ID="Button2" runat="server" CssClass="btn btn-primary" Text="Cancel" CommandName="cancelOrder" CommandArgument='<%#Eval("order_id")+","+Eval("email") %>' />
                                </p>
                                <p>
                                    <span style="color: red">For More Inquire Contact :-</span>
                                    <asp:Label ID="Label3" runat="server" Text="7485839442" Font-Bold="True" Font-Italic="True" ForeColor="Blue"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>

            <asp:Button ID="DOrders" class="btn btn-success" runat="server" Text="Delivered Orders" OnClick="DOrders_Click" />
            <asp:Button ID="Dhide" runat="server" class="btn btn-success" Text="Hide Delivered Orders" OnClick="Dhide_Click" Visible="False" />

            <asp:Button ID="Show" class="btn btn-danger" runat="server" Text="Show Cancel Orders" OnClick="show" />
            
            <asp:Button ID="Hide" class="btn btn-danger" runat="server" Visible="false" Text="Hide Cancel Orders" OnClick="hide" />
        </div>
    </div>


    <%--cancel_order--%>
    <div class="container bootdey" style="width: 1220px">

        <asp:Panel ID="Panel2" Visible="false" runat="server">
            <asp:Repeater ID="order_History" runat="server">
                <ItemTemplate>
                    <div class="panel-body" id="style" style="margin: 5px; background-color: ; border-radius: 30px">
                        <div class="col-md-3">
                            <div class="pro-img-details" style="margin-bottom: 10px">
                                <asp:Image ID="pimage" ImageUrl='<%#Eval("product_image") %>' runat="server" Height="190px" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <p style="font-size: 10px; margin-bottom: -5px;">2/28/2022 11:45:08 PM</p>
                            <p>
                                <span>
                                    <asp:Label ID="Label1" runat="server" Text="Order Id :-" Font-Bold="True" Font-Size="Medium"></asp:Label></span>
                                <span>
                                    <asp:Label ID="Order_id" runat="server" Text='<%#Eval("order_id") %>' Font-Italic="True" ForeColor="Blue"></asp:Label></span>
                                <br />
                                <span>Address:-</span>
                                <br />
                                <span style="font-size: 20px"><b>
                                    <asp:Label ID="First" runat="server" Text='<%#Eval("fname") %>'></asp:Label>
                                    <asp:Label ID="Last" runat="server" Text='<%#Eval("lname") %>'></asp:Label>
                                </b>
                                </span>
                                <br />
                                <asp:Label ID="address" runat="server" Text='<%#Eval("address") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                Pin Code:
                                <asp:Label ID="pin" runat="server" Text='<%#Eval("pincode") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                Mobile:
                                <asp:Label ID="mob" runat="server" Text='<%#Eval("mobile_no") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                <asp:Label ID="mail" runat="server" Text='<%#Eval("email") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                <asp:Label ID="City" runat="server" Text='<%#Eval("city") %>' Font-Italic="True"></asp:Label>
                                <asp:Label ID="State" runat="server" Text='<%#Eval("state") %>' Font-Italic="True"></asp:Label>
                                <br />
                            </p>

                        </div>


                        <div class="col-md-4">

                            <div class="m-bot15">
                                <asp:Label ID="pname" runat="server" Text='<%#Eval("product_name") %>' Font-Italic="True" ForeColor="Blue"></asp:Label>
                                X
                            <asp:Label ID="qty" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                                <br />
                                <strong>Total Amount : </strong>
                                <span class="amount-old">
                                    <asp:Label ID="pprice" runat="server" Text='<%#Eval("total_amount") %>'></asp:Label></span>/
                            <asp:Label ID="mode" runat="server" Text='<%#Eval("payment_mode") %>' ForeColor="Gray"></asp:Label>
                            </div>
                            <p>
                                <strong>Status : </strong>
                                <asp:Label ID="status" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                            </p>
                            <p>

                                <asp:Label ID="Label2" runat="server" Text="Estimate Delivery Date :- " Font-Bold="True" ForeColor="Green"></asp:Label>
                                <asp:Label ID="EDD" runat="server" Text="Thrusday 13th Dec" Font-Bold="True"></asp:Label>
                            </p>
                         
                            <p>
                                <span style="color: red">For More Inquire Contact :-</span>
                                <asp:Label ID="Label3" runat="server" Text="7485839442" Font-Bold="True" Font-Italic="True" ForeColor="Blue"></asp:Label>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </div>



    <%--Delivered Order--%>
    <div class="container bootdey" style="width: 1220px">
        <asp:Panel ID="Panel3" Visible="false" runat="server">
            <asp:Repeater ID="delivered_orders" runat="server">
                <ItemTemplate>
                    <div class="panel-body" id="style" style="margin: 5px; background-color: ; border-radius: 30px">
                        <div class="col-md-3">
                            <div class="pro-img-details" style="margin-bottom: 10px">
                                <asp:Image ID="pimage" ImageUrl='<%#Eval("product_image") %>' runat="server" Height="190px" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <p style="font-size: 10px; margin-bottom: -5px;">2/28/2022 11:45:08 PM</p>
                            <p>
                                <span>
                                    <asp:Label ID="Label1" runat="server" Text="Order Id :-" Font-Bold="True" Font-Size="Medium"></asp:Label></span>
                                <span>
                                    <asp:Label ID="Order_id" runat="server" Text='<%#Eval("order_id") %>' Font-Italic="True" ForeColor="Blue"></asp:Label></span>
                                <br />
                                <span>Address:-</span>
                                <br />
                                <span style="font-size: 20px"><b>
                                    <asp:Label ID="First" runat="server" Text='<%#Eval("fname") %>'></asp:Label>
                                    <asp:Label ID="Last" runat="server" Text='<%#Eval("lname") %>'></asp:Label>
                                </b>
                                </span>
                                <br />
                                <asp:Label ID="address" runat="server" Text='<%#Eval("address") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                Pin Code:
                                <asp:Label ID="pin" runat="server" Text='<%#Eval("pincode") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                Mobile:
                                <asp:Label ID="mob" runat="server" Text='<%#Eval("mobile_no") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                <asp:Label ID="mail" runat="server" Text='<%#Eval("email") %>' Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                                <asp:Label ID="City" runat="server" Text='<%#Eval("city") %>' Font-Italic="True"></asp:Label>
                                <asp:Label ID="State" runat="server" Text='<%#Eval("state") %>' Font-Italic="True"></asp:Label>
                                <br />
                            </p>

                        </div>


                        <div class="col-md-4">

                            <div class="m-bot15">
                                <asp:Label ID="pname" runat="server" Text='<%#Eval("product_name") %>' Font-Italic="True" ForeColor="Blue"></asp:Label>
                                X
                            <asp:Label ID="qty" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                                <br />
                                <strong>Total Amount : </strong>
                                <span class="amount-old">
                                    <asp:Label ID="pprice" runat="server" Text='<%#Eval("total_amount") %>'></asp:Label></span>/
                            <asp:Label ID="mode" runat="server" Text='<%#Eval("payment_mode") %>' ForeColor="Gray"></asp:Label>
                            </div>
                            <p>
                                <strong>Status : </strong>
                                <asp:Label ID="status" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                            </p>
                            <p>

                                <asp:Label ID="Label2" runat="server" Text="Estimate Delivery Date :- " Font-Bold="True" ForeColor="Green"></asp:Label>
                                <asp:Label ID="EDD" runat="server" Text="Thrusday 13th Dec" Font-Bold="True"></asp:Label>
                            </p>
                         
                            <p>
                                <span style="color: red">For More Inquire Contact :-</span>
                                <asp:Label ID="Label3" runat="server" Text="7485839442" Font-Bold="True" Font-Italic="True" ForeColor="Blue"></asp:Label>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </div>

</asp:Content>

