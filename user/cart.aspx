<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="cart.aspx.cs" Inherits="user_cart" %>

<asp:Content ContentPlaceHolderID="Head_content" runat="server" ID="head">
    <style>
        .proNameViewCart {
            font-size: 15px;
            line-height: 25px;
            font-family: sans-serif;
            font-weight: 600;
            color: #696e80;
        }

        .priceGray {
            font-size: 15px;
            font-family: sans-serif;
            font-weight: 400;
            color: dimgray;
        }

        .buyNowbtn {
            border-radius: 3px;
            outline: 0;
            margin-top: 10px;
            margin-bottom: 20px;
            font-size: 13px;
            min-height: 22px;
            padding: 10px 15px;
            font-weight: 500;
            background-color: #000000;
            color: #fff;
            border: 1px solid #14cda8;
            width: 100%;
        }

        .cart_delete a {
            background: #e62a2abd;
            color: #000000;
            padding: 5px 7px;
            font-size: 16px;
            margin-top: 10px;
        }

        .cart_quantity_button a {
            background: #0f59fe;
            color: #ffffff;
            display: inline-block;
            font-size: 30px;
            height: 28px;
            overflow: hidden;
            text-align: center;
            width: 35px;
            float: left;
            line-height: 28px;
        }
        .desc{
            height:40px;
            overflow:hidden;
        }
      


       
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section id="cart_items">
        <div class="container">
            <div class="row">
                <div class="breadcrumbs">
                    <h1 class="text-center">MY CART</h1>
                </div>
                <div class="col-lg-8" style="width: 75%">

                    <div class="table-responsive cart_info">
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu" style="background-color: #fe0f0f">
                                    <td class="image">Item</td>
                                    <td class="description"></td>
                                    <td class="price">Price</td>
                                    <td class="quantity" style="width: 15%; text-align: center">Quantity</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="Repeter_cart" runat="server" OnItemCommand="Repeter_cart_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="cart_product">
                                                <a href="">
                                                    <img height="100px" src='<%#Eval("product_image") %>' alt=""></a>
                                            </td>
                                            <td class="cart_description ">
                                                <h1><%#Eval("product_name") %></h1>
                                                <p class="text-justify desc"><%#Eval("product_description") %></p>
                                            </td>
                                            <td class="cart_price">
                                                <p><%#Eval("product_price") %></p>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <asp:LinkButton ID="doPlus" CommandArgument='<%#Eval("cid") %>' class="cart_quantity_up" runat="server" CommandName="qtyIncrement">+</asp:LinkButton>
                                                    <input class="cart_quantity_input" type="text" name="quantity" value="<%#Eval("quantity") %>" autocomplete="off" size="2">
                                                    <asp:LinkButton ID="doMinus" CommandArgument='<%#Eval("cid") %>' class="cart_quantity_down" runat="server" CommandName="qtyDecrement">-</asp:LinkButton>
                                                </div>
                                            </td>

                                            <td class="cart_total">
                                                <p class="cart_total_price"><%#Eval("total_amount") %></p>
                                            </td>
                                            <td class="cart_delete">
                                                <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("cid") %>' class="cart_quantity_delete btn btn-outline-danger" runat="server" CommandName="removeThisItem"><i class="fa fa-times"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <asp:Label ID="cart_empty" class="proNameViewCart" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-lg-3" runat="server" id="divAmountSect" style="border: 1px solid grey">
                    <div>
                        <h5 class="proNameViewCart">Price Details</h5>
                        <div>
                            <label class=" ">Total</label>
                            <span class="pull-right priceGray" runat="server" id="spanCartTotal"></span>
                        </div>
                        <div>
                            <label class=" ">Delivery Charge</label>
                            <span class="pull-right priceGreen" runat="server" id="spanDeliveryCharge"></span>
                        </div>
                    </div>
                    <div>
                        <div class="cartTotal">
                            <label>Cart Total</label>
                            <span class="pull-right " runat="server" id="spanTotal"></span>
                            <div>
                                <asp:Button ID="btnBuyNow" CssClass="buyNowbtn" runat="server" Text="BUY NOW" OnClick="btnBuyNow_Click" />
                                <asp:Label ID="oneOrder" runat="server" Text="One Order at a Time...." style="font-weight: 700; color: #FF0000" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

