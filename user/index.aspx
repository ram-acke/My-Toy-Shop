<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="user_index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head_content" runat="Server">
    <style>
        .productinfo img {
            width: 80%;
            height: 200px;
        }

        .Myli {
            display: inline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section id="slider">
        <!--slider-->
        <div class="container">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/user/img/slider.jpg" Height="380px" Width="100%" />
        </div>
    </section>
    <!--features_items-->

    <div class="container">
        <div class="col-sm-9 padding-right">
            <div class="container features_items">
                <h2 class="title text-center" style="color: blue">Items</h2>
                <div class="row">
                    <asp:Repeater ID="sp1" runat="server">
                        <ItemTemplate>
                            <li class="Myli">
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src='<%#Eval("product_image") %>' alt="" />
                                                <h2 style="color: blue">₹<%#Eval("product_price") %></h2>
                                                <p><%#Eval("product_name") %></p>
                                                <a href="view.aspx?id=<%#Eval("product_id") %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>View Product</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>




</asp:Content>

