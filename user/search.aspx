<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="user_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" runat="Server">
    <style> 
         .productinfo img {
            width: 40%;
        }
         .searchBG{
             background-color:white;
             width: 100%;
             list-style:none;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-9 searchBG padding-right">
        <div class="container features_items">
            <!--features_items-->
            <h2 class="title text-center" style="color: blue">Features Items</h2>
            <asp:Repeater ID="sp1" runat="server">
               
                <ItemTemplate>
                    <li>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src='<%#Eval("product_image") %>' alt="" />
                                        <h2 style="color: blue">₹<%#Eval("product_price") %></h2>
                                        <p><%#Eval("product_name") %></p>
                                        <a href="view.aspx?id=<%#Eval("product_id") %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
               
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

