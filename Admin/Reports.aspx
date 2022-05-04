<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .box {
            width: 100%;
            display: inline-block;
        }

        .auto-style2 {
            width: 223px;
            height: 23px;
        }

        .auto-style3 {
            height: 23px;
            width: 207px;
        }

        .auto-style4 {
            height: 22px;
        }

        .auto-style7 {
            height: 22px;
            width: 70px;
            font-size: medium;
            text-align: center;
        }

        .auto-style8 {
            width: 70px;
        }

        .auto-style9 {
            height: 22px;
            width: 395px;
        }

        .auto-style10 {
            width: 395px;
        }

        .auto-style11 {
            height: 22px;
            width: 95px;
        }

        .auto-style12 {
            width: 95px;
        }

        .auto-style16 {
            height: 22px;
            width: 95px;
            font-size: small;
        }

        .auto-style17 {
            height: 22px;
            width: 395px;
            font-size: small;
        }
        .auto-style23 {
        }
        .auto-style28 {
            text-align: center;
            width: 629px;
        }
        .auto-style42 {
            height: 22px;
            width: 558px;
        }
        .auto-style43 {
            width: 558px;
        }
        .auto-style44 {
            font-size: large;
        }
        .auto-style46 {
            width: 223px;
        }
        .auto-style47 {
            width: 207px;
        }
        .auto-style49 {
            text-align: center;
            width: 538px;
            height: 209px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Panel ID="Panel2" runat="server" Height="112px" Style="margin-top: 0px">
        <table class="w-100">
            <tr>
                <td class="auto-style42">&nbsp;</td>
                <td class="auto-style16">
                    <strong>Start Month</strong></td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style17">
                    <strong>End Month</strong></td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style42">&nbsp;</td>
                <td class="auto-style11">
                    <asp:TextBox ID="startDate" runat="server" placeholder="MM/DD/YYY" Width="107px"></asp:TextBox>
                </td>
                <td class="auto-style7"><strong>To</strong></td>
                <td class="auto-style9">
                    <asp:TextBox ID="endDate" runat="server" placeholder="MM/DD/YYY" Width="107px"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style12">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="startDate" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^(1[0-2]|0[1-9])/(3[01]|[12][0-9]|0[1-9])/[0-9]{4}$">Invalid Date</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="endDate" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^(1[0-2]|0[1-9])/(3[01]|[12][0-9]|0[1-9])/[0-9]{4}$">Invalid Date</asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Button ID="search" class="btn btn-success" runat="server" Text="Search" OnClick="search_Click" />
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <hr />
    <asp:Panel ID="repo" runat="server">
        <br />
        <table class="nav-justified" aria-setsize="0">
            <tr>
                <td class="auto-style49">
                    <table align="center" class="w-100">
                        <tr>
                            <td class="auto-style23" colspan="2">
                                <asp:Label ID="Label6" runat="server" Font-Size="30px" Text="Pankaj Toy Shop"></asp:Label>
                                <br />
                                <strong>Reports</strong></td>
                        </tr>
                        <tr>
                            <td class="auto-style46">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="20px" Text="Sections"></asp:Label>
                            </td>
                            <td class="auto-style47">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="20px" Text="Reports"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label5" runat="server" Font-Size="15px" Style="font-style: italic" Text="Total Sales Amount"></asp:Label>
                            </td>
                            <td class="auto-style3">₹<asp:Label ID="sales" runat="server" Text="0" style="font-weight: 700"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style46">Total Orders</td>
                            <td class="auto-style47">
                                <asp:Label ID="orders" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style46">Total Pending Orders</td>
                            <td class="auto-style47">
                                <asp:Label ID="PendingOrder" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style46">Total Delivered Orders</td>
                            <td class="auto-style47">
                                <asp:Label ID="DeliveredOrder" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style46">Total Cancel Orders</td>
                            <td class="auto-style47">
                                <asp:Label ID="CancelOrder" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style46">Total Online Payment</td>
                            <td class="auto-style47">
                                <asp:Label ID="Online" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style46">Total Cash on Delivery Payment</td>
                            <td class="auto-style47">
                                <asp:Label ID="COD" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style28" rowspan="2">
                    <div class="text-sm-center">
                        <strong><span class="auto-style44">TOP SELLING PRODUCTS</span></strong></div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" Height="421px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="621px">
                        <Columns>
                            <asp:ImageField DataImageUrlField="product_image" HeaderText="Products">
                                <ControlStyle Height="50px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:BoundField DataField="product_id" HeaderText="Products Id" SortExpression="product_id" />
                            <asp:BoundField DataField="product_name" HeaderText="Products Name" SortExpression="product_name" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="product_price" HeaderText="Products Price" SortExpression="product_price" />
                            <asp:BoundField DataField="qty" HeaderText="Total Selling Qty" ReadOnly="True" SortExpression="qty" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style49"></td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select orders.product_id,products.product_name,products.product_image,products.product_price,SUM(orders.quantity) as qty from orders,products,order_details where orders.product_id=products.product_id and order_details.order_date Between @startDATE and @endDATE Group By orders.product_id,products.product_name,products.product_image,products.product_price Having COUNT(*)&gt;1">
            <SelectParameters>
                <asp:FormParameter DefaultValue="01/01/2022" FormField="starDate" Name="startDATE" />
                <asp:FormParameter DefaultValue="12/01/2022" FormField="endDate" Name="endDATE" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
   <%-- <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Font-Bold="True" Text="Download Reports" OnClick="Button1_Click" />--%>
</asp:Content>

