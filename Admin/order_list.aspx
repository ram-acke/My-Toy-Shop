<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="order_list.aspx.cs" Inherits="Admin_order_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            min-height: 100vh;
            background-color:black;
        }

        .text-gray {
            color: #aaa;
        }

        img {
            height: 170px;
            width: 140px;
        }

        .mylink {
            margin-top: 5px;
            margin-bottom: 5px;
            margin-left: 5px;
        }

        .nav {
            width: 140%;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container mylink">
        <ul class="nav justify-content-center">
            <li class="nav-item mylink">
                <asp:Button ID="cancelOrder" class="btn btn-danger" runat="server" Text="Cancel Orders" OnClick="cancelOrder_Click" />
            </li>
            <li class="nav-item mylink">
                <asp:Button ID="pendingOrders" class="btn btn-warning" runat="server" Text="Pending Orders" OnClick="pendingOrders_Click" />

            </li>
            <li class="nav-item mylink">
                <asp:Button ID="deliveredOrders" class="btn btn-success" runat="server" Text="Delivered Orders" OnClick="deliveredOrders_Click" />
            </li>
        </ul>
    </div>

    <%--cancel Order--%>
    <asp:Panel ID="cancel" runat="server" Visible="False">
        <div class="container mt-1 border border-primary bg-light">
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Order Id</th>
                            <th scope="col">Product</th>
                            <th scope="col">Name/Qty</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Address</th>
                            <th scope="col">Mode</th>
                            <th scope="col">Status</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="showCancelOrders" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("order_id") %></td>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("product_image") %>' Height="100px" /></td>
                                    <td><%#Eval("product_name") %> X <%#Eval("quantity") %></td>
                                    <td><%#Eval("total_amount") %></td>
                                    <td><%#Eval("address") %></td>
                                    <td><%#Eval("payment_mode") %></td>
                                    <td><%#Eval("status") %></td>
                                    <td><a href="view_order.aspx?oi=<%#Eval("order_id") %>">View</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </asp:Panel>


    <%--pending Order--%>

    <asp:Panel ID="pending" runat="server">
        <div class="container mt-1 border border-primary bg-light">
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Order Id</th>
                            <th scope="col">Product</th>
                            <th scope="col">Name/Qty</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Address</th>
                            <th scope="col">Mode</th>
                            <th scope="col">Status</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="showPendingOrders" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("order_id") %></td>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("product_image") %>' Height="100px" /></td>
                                    <td><%#Eval("product_name") %> X <%#Eval("quantity") %></td>
                                    <td><%#Eval("total_amount") %></td>
                                    <td><%#Eval("address") %></td>
                                    <td><%#Eval("payment_mode") %></td>
                                    <td><%#Eval("status") %></td>
                                    <td><a href="view_order.aspx?oi=<%#Eval("order_id") %>">View</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:Label ID="PO" runat="server" Text="No Pending Orders" style="color: #FF0000" Visible="False"></asp:Label>
            </div>
        </div>
    </asp:Panel>



    <%--Delivered Order--%>

    <asp:Panel ID="delivered" runat="server" Visible="False">
        <div class="container mt-1 border border-primary bg-light">
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Order Id</th>
                            <th scope="col">Product</th>
                            <th scope="col">Name/Qty</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Address</th>
                            <th scope="col">Mode</th>
                            <th scope="col">Status</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="showDeliveredOrders" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("order_id") %></td>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("product_image") %>' Height="100px" /></td>
                                    <td><%#Eval("product_name") %> X <%#Eval("quantity") %></td>
                                    <td><%#Eval("total_amount") %></td>
                                    <td><%#Eval("address") %></td>
                                    <td><%#Eval("payment_mode") %></td>
                                    <td><%#Eval("status") %></td>
                                    <td><a href="view_order.aspx?oi=<%#Eval("order_id") %>">View</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </asp:Panel>

</asp:Content>

