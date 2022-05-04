<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Admin_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background-color: #99ccff;
        }

        .col {
            margin-bottom: 25px;
            border: 1px solid black;
            padding: 10px;
            border-radius: 25px;
            margin: 5px;
            width:270px;
        }

        .container {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container d-flex justify-content-center">
        <div class="row">
            <div class="col ">
                <a href="order_list.aspx">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Admin/img/orderList.png" Height="200px" />
                    <h1 class="title d-flex justify-content-center">Order List</h1>
                </a>
            </div>
            <div class="col ">
                <a href="customer_list.aspx">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Admin/img/customer_list.png" Height="200px" />
                    <h1 class="title d-flex justify-content-center">Customer List</h1>

                </a>
            </div>
                 <div class="col ">
                <a href="add_product.aspx">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/img/add_product.png" Height="200px" />
                    <h1 class="title d-flex justify-content-center">Add Products</h1>

                </a>
            </div>
        </div>
    </div>
    <div class="container d-flex justify-content-center">
        <div class="row">
       
            <div class="col ">
                <a href="product_list.aspx">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Admin/img/product_list.png" Height="200px" />
                    <h1 class="title d-flex justify-content-center">Product List</h1>

                </a>
            </div>
        </div>
    </div>
</asp:Content>

