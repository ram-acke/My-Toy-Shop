<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="customer_list.aspx.cs" Inherits="Admin_customer_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background: #7855eac2;
        }

        /*.icons i {
            color: #b5b3b3;
            border: 1px solid #b5b3b3;
            padding: 6px;
            margin-left: 4px;
            border-radius: 5px;
            cursor: pointer;
        }

        .activity-done {
            font-weight: 600;
        }

        .list-group li {
            margin-bottom: 12px;
        }

        .list-group-item {
        }

        .list li {
            list-style: none;
            padding: 10px;
            border: 1px solid #e3dada;
            margin-top: 12px;
            border-radius: 5px;
            background: #fff;
        }

        .checkicon {
            color: green;
            font-size: 19px;
        }

        .date-time {
            font-size: 12px;
        }

        .profile-image img {
            margin-left: 3px;
        }*/
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="container d-flex justify-content-center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="None" ForeColor="#333333" Height="360px" Width="958px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="ufname" HeaderText="First Name" SortExpression="ufname" />
                    <asp:BoundField DataField="ulname" HeaderText="Last Name" SortExpression="ulname" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                    <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                    <asp:BoundField DataField="upincode" HeaderText="PinCode" SortExpression="upincode" />
                    <asp:BoundField DataField="ustate" HeaderText="State" SortExpression="ustate" />
                    <asp:BoundField DataField="ucity" HeaderText="City" SortExpression="ucity" />
                </Columns>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
    </asp:Panel>



    <%--<div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center activity">
                    <div><i class="fa fa-clock-o"></i><span class="ml-2">11h 25m</span></div>
                    <div><span class="activity-done">Customer Lists</span></div>
                    <div class="icons"><i class="fa fa-search"></i><i class="fa fa-ellipsis-h"></i></div>
                </div>
                <div class="mt-3">
                    <ul class="list list-inline">
                        <li class="d-flex justify-content-between">
                            <div class="d-flex flex-row align-items-center">
                                <i class="fa fa-check-circle checkicon"></i>
                                <div class="ml-2">
                                    <h6 class="mb-0">Kickoff meeting</h6>
                                    <div class="d-flex flex-row mt-1 text-black-50 date-time">
                                        <div><i class="fa fa-calendar-o"></i><span class="ml-2">22 May 2020 11:30 PM</span></div>
                                        <div class="ml-3"><i class="fa fa-clock-o"></i><span class="ml-2">6h</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center">
                                <div class="d-flex flex-column mr-2">
                                    <div class="profile-image">
                                        <img class="rounded-circle" src="https://i.imgur.com/wwd9uNI.jpg" width="30">
                                    </div>
                                    <span class="date-time">11/4/2020 12:55</span>
                                </div>
                                <i class="fa fa-ellipsis-h"></i>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [customer_login]"></asp:SqlDataSource>
</asp:Content>

