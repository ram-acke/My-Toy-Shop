<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="view_order.aspx.cs" Inherits="Admin_view_order" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container bootdey" style="width: 1220px">
        <div class="col-md-12">
            <div class="panel-body">
                <div class="col-md-6">
                    <div class="pro-img-details" style="margin-bottom: 10px">
                        <asp:Image ID="pimage" runat="server" />
                    </div>
                </div>
                <div class="col-md-6">
                    <h5>Address:-</h5>
                    <h4 class="pro-d-title">
                        <a>
                            <asp:Label ID="Dname" runat="server" Text="use"></asp:Label>
                        </a>
                    </h4>
                    <p>
                        <asp:Label ID="address" runat="server" Text="Label" Font-Bold="True" Font-Italic="True"></asp:Label>
                    </p>
                    <div class="m-bot15">
                        <asp:Label ID="pname" runat="server" Text="Label" Font-Italic="True" ForeColor="Blue"></asp:Label>
                        X
                            <asp:Label ID="qty" runat="server" Text="Label"></asp:Label>
                        <br />
                        <strong>Total Amount : </strong>
                        <span class="amount-old">
                            <asp:Label ID="pprice" runat="server" Text="Label"></asp:Label></span>/
                            <asp:Label ID="mode" runat="server" Text="Label"></asp:Label>
                    </div>
                    <p>
                        <strong>Status : </strong>
                        <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>
        <table class="table table-active">
            <thead>
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Pin Code</th>
                    <th scope="col">Mode of Payment</th>
                    <th scope="col">Mobile No.</th>
                    <th scope="col">Email</th>
                    <th scope="col">City</th>
                    <th scope="col">State</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">
                        <asp:Label ID="Order_id" runat="server" Text="Label"></asp:Label></th>
                    <td>
                        <asp:Label ID="First" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Last" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="pin" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="mop" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="mob" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="mail" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="City" runat="server" Text="Label"></asp:Label></td>
                    <td>
                        <asp:Label ID="State" runat="server" Text="Label"></asp:Label></td>
                      <td>
                          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                          </asp:DropDownList>
                    </td>

                </tr>
            </tbody>
        </table>
        <a href="order_list.aspx">Go Back <<</a>
    </div>
</asp:Content>

