<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 585px;
        }
        .auto-style11 {
            height: 148px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BorderColor="Black" Height="528px">
            <table class="auto-style3" border="1" align="center">
                <tr>
                    <td style="text-align: center" class="auto-style2"><strong>MY Toy Shop</strong></td>
                </tr>
                <tr>
                    <td style="text-align: center" class="auto-style2">Invoice Reciept</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Order no.</strong>
                        <asp:Label ID="order_id" runat="server"></asp:Label>
                        <br />
                        <strong>Order Date : </strong>
                        <asp:Label ID="order_date" runat="server" style="font-style: italic"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style13">
                                    <table border="1" class="auto-style1">
                                        <tr>
                                            <td class="auto-style11"><em>Delivery Address:</em><br />
                                                <asp:Label ID="name" runat="server" style="font-weight: 700"></asp:Label>
                                                <br />
                                                <asp:Label ID="address" runat="server" style="font-style: italic"></asp:Label>
                                                <br />
                                                <strong>Pin Code</strong> :
                                                <asp:Label ID="pin" runat="server"></asp:Label>
                                                <br />
                                                <strong>Mobile</strong> :
                                                <asp:Label ID="mobile" runat="server"></asp:Label>
                                                <br />
                                                <asp:Label ID="mail" runat="server"></asp:Label>
                                                <br />
                                                <em>Vadodara Gujrat</em></td>
                                        </tr>
                                    </table>
                                </td>
                                <td><strong>Seller</strong> <strong>Address</strong>:<br /> <em>MWP Limda,Waghodia</em></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="581px">
                            <Columns>
                                <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                                <asp:BoundField DataField="product_price" HeaderText="Price" SortExpression="product_price" />
                                <asp:BoundField DataField="quantity" HeaderText="Qty" SortExpression="quantity" />
                                <asp:BoundField DataField="total_amount" HeaderText="Total Amount" ReadOnly="True" SortExpression="total_amount" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Grand</strong> <strong>Total</strong> :<asp:Label ID="gtotal" runat="server"></asp:Label>
                        <br />
                        <strong>Payment</strong> <strong>Mode</strong> :
                        <asp:Label ID="modeOFpayment" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Declaration</strong> : we declare that this invoice shows actual price of the goods&nbsp; described inclusive of taxes and that all particulars are true and correct
                        <br />
                        Incase all Particulars</td>
                </tr>
            </table>
        </asp:Panel>
         <asp:Button ID="Button2" runat="server" BackColor="Blue" Font-Bold="True" ForeColor="White" Height="51px" OnClick="Button1_Click1" Text="Download Invoice" Width="147px" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select products.product_name,products.product_price,orders.quantity,orders.total_amount from orders,products where orders.order_id=@invoice and products.product_id=orders.product_id and orders.user_id=@user_id">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="5431005" Name="invoice" QueryStringField="invoice" />
                <asp:SessionParameter DefaultValue="1005" Name="user_id" SessionField="UID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
