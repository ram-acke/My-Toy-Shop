<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="view.aspx.cs" Inherits="user_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

            <div class="container bootdey" style="width: 1220px">
                <div class="col-md-12">
                    <section class="panel">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <div class="pro-img-details" style="margin-bottom:10px">
                                    <asp:Image ID="pimage" runat="server" />
                                </div>
                               <%-- <div class="pro-img-list">
                                    <a href="#">
                                        <img src="https://via.placeholder.com/115x100/87CEFA/000000" alt="">
                                    </a>
                                    <a href="#">
                                        <img src="https://via.placeholder.com/115x100/FF7F50/000000" alt="">
                                    </a>
                                    <a href="#">
                                        <img src="https://via.placeholder.com/115x100/20B2AA/000000" alt="">
                                    </a>
                                    <a href="#">
                                        <img src="https://via.placeholder.com/120x100/20B2AA/000000" alt="">
                                    </a>
                                </div>--%>
                            </div>
                            <div class="col-md-6">
                                <h4 class="pro-d-title">
                                    <a>
                                    <asp:Label ID="pname" runat="server" Text="Label"></asp:Label>
                                    </a>
                                </h4>
                                <p>
                                    <asp:Label ID="pdesc" runat="server" Text="Label"></asp:Label>
                                </p>
                                <div class="m-bot15">
                                    <strong>Price : </strong><span class="amount-old">
                                        <asp:Label ID="pprice" runat="server" Text="Label"></asp:Label></span>
                                </div>
                                <br />
                                <p>
                                    <asp:Button ID="add_to_cart" OnClick="add_to_cart_Click" CssClass="btn btn-round btn-danger font-italic fa fa-shopping-cart" runat="server" Text="&#xf07a; Add to Cart" Height="34px" />
                                    <a id="added" runat="server" Class="btn btn-round btn-success font-italic fa fa-shopping-cart" style="height:30px" href="cart.aspx"></a>
                                </p>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

</asp:Content>

