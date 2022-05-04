<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="ListOfOrders.aspx.cs" Inherits="user_ListOfOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container bootdey" style="width: 1220px">
        <asp:Panel ID="Panel4" runat="server">
            <asp:Repeater ID="demo" runat="server" OnItemCommand="show_orders_ItemCommand1">
                <ItemTemplate>
                    <div class="panel-body" id="style" style="margin: 5px; background-color: #ebff42ad; border-radius: 30px">
                        <%--order--%>
                        <div class="col-md-3">
                            <table>
                                <asp:Repeater ID="fetchOrders" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="pro-img-details" style="margin-bottom: 10px">
                                                    <asp:Image ID="pimage" ImageUrl="~/product_image/19.jpeg" runat="server" Height="80px" />
                                                </div>
                                            </td>

                                            <td>
                                                <div class="m-bot15">
                                                    <asp:Label ID="Label4" runat="server" Text="UV + UF + Silver Boost With Storage" Font-Italic="True" ForeColor="Blue"></asp:Label>
                                                    X
                            <asp:Label ID="Label5" runat="server" Text="1"></asp:Label>
                                                    <br />
                                                    <strong>Total Amount : </strong>
                                                    <span class="amount-old">
                                                        <asp:Label ID="Label6" runat="server" Text="9990"></asp:Label></span>/
                            <asp:Label ID="Label7" runat="server" Text="COD" ForeColor="Gray"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="select * from orders,order_details,products where orders.order_id=order_details.order_id and order_details.user_id=@user_id and products.product_id=orders.product_id">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="UID" DefaultValue="1005" Name="user_id"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </table>

                        </div>
                        <%--address--%>
                        <div class="col-md-3">
                            <p style="font-size: 10px; margin-bottom: -5px;">2/28/2022 11:45:08 PM</p>
                            <p>
                                <span>
                                    <asp:Label ID="Label1" runat="server" Text="Order Id :-" Font-Bold="True" Font-Size="Medium"></asp:Label></span>
                                <span>
                                    <asp:Label ID="Order_id" runat="server" Text='102351>' Font-Italic="True" ForeColor="Blue"></asp:Label></span>
                                <br />
                                <span>Address:-</span>
                                <br />
                                <span style="font-size: 20px"><b>
                                    <asp:Label ID="First" runat="server" Text="Ram"></asp:Label>
                                    <asp:Label ID="Last" runat="server" Text="Kumar"></asp:Label>
                                </b>
                                </span>
                                <br />
                                <asp:Label ID="address" runat="server" Text="Post Limda, Waghodia, Gujarat 391760" Font-Bold="True" Font-Italic="True"></asp:Label>
                                <br />
                               
                            </p>

                        </div>

                        <%--other--%>
                        <div class="col-md-4">
                            <p>
                                <asp:Label ID="Label2" runat="server" Text="Estimate Delivery Date :- " Font-Bold="True" ForeColor="Green"></asp:Label>
                                <asp:Label ID="EDD" runat="server" Text="Thrusday 13th Dec" Font-Bold="True"></asp:Label>
                            </p>
                            <p>
                                <a target="_blank" class="btn btn-primary" href="Invoice.aspx">Invoice</a>
                                <asp:LinkButton ID="Button2" runat="server" CssClass="btn btn-primary" Text="Cancel" CommandName="cancelOrder" CommandArgument="" />
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

