<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="product_list.aspx.cs" Inherits="Admin_product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #eee;
        }

        /*.mt-50 {
            margin-top: 50px;
            height: 504px;
        }*/

        .product-card {
            display: block;
            position: relative;
            width: 100%;
            border: 1px solid #e5e5e5;
            border-radius: 5px;
            background-color: #fff;
            margin: auto;
        }

        .mb-30 {
            margin-bottom: 30px !important;
        }

        .product-badge {
            position: absolute;
            height: 24px;
            padding: 0 14px;
            border-radius: 3px;
            color: #fff !important;
            font-size: 12px;
            font-weight: 400;
            letter-spacing: .025em;
            line-height: 24px;
            white-space: nowrap;
            top: 12px;
            left: 12px;
        }

        .bg-secondary {
            background-color: #dc3545 !important;
        }

        .bg-success {
            background-color: #21bd4a !important;
        }

        .product-thumb > img {
            display: block;
            width: 100%;
            height: 200px;
            padding: 14px;
        }

        .product-category {
            width: 100%;
            margin-bottom: 6px;
            font-size: 12px;
        }

        .product-card-body {
            padding: 18px;
            padding-top: 0px;
            text-align: center;
        }

        .product-category > a {
            transition: color .2s;
            color: #999;
            text-decoration: none;
        }

        .product-title {
            margin-bottom: 0px;
            font-size: 16px;
            font-weight: normal;
            margin-top: 0px;
        }

            .product-title > a {
                transition: color .3s;
                color: #232323;
                text-decoration: none;
            }

        .product-price {
            display: inline-block;
            margin-bottom: 10px;
            padding: 4px 15px;
            border-radius: 4px;
            background-color: #3ba9fc;
            color: #ffffff;
            font-size: 16px;
            font-weight: normal;
            text-align: center;
            margin-top:5px;
        }

        .product-button-group {
            display: table;
            width: 100%;
            border-top: 1px solid #e5e5e5;
            table-layout: fixed;
        }

        ..product-button-group a:hover {
            color: #3ba9fc;
        }

        .product-button:first-child {
            border-bottom-left-radius: 5px;
        }

        .product-button {
            display: table-cell;
            position: relative;
            height: 62px;
            padding: 10px;
            transition: background-color .3s;
            border: 0;
            border-right: 1px solid #e5e5e5;
            background: none;
            color: #505050;
            overflow: hidden;
            vertical-align: middle;
            text-align: center;
            text-decoration: none;
        }

            .product-button:hover > span {
                -webkit-transform: translateY(0);
                -ms-transform: translateY(0);
                transform: translateY(0);
                opacity: 1;
            }

            .product-button > span {
                display: block;
                position: absolute;
                bottom: 9px;
                left: 0;
                width: 100%;
                -webkit-transform: translateY(12px);
                -ms-transform: translateY(12px);
                transform: translateY(12px);
                font-size: 12px;
                white-space: nowrap;
                opacity: 0;
            }

            .product-button > i,
            .product-button > span {
                transition: all .3s;
            }

            .product-button > i {
                display: inline-block;
                position: relative;
                margin-top: 5px;
                font-size: 18px;
            }

            .product-button:hover > i {
                -webkit-transform: translateY(-10px);
                -ms-transform: translateY(-10px);
                transform: translateY(-10px);
            }

        .container {
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row w-100">
            <asp:DataList ID="Repeater1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="Repeater1_ItemCommand">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="product-card">
                        <%--<div class="product-badge bg-secondary border-default text-body">Out of stock</div>--%>
                        <a class="product-thumb" href="#" data-abc="true">
                            <img src='<%#Eval("product_image") %>' alt="Product"></a>
                        <div class="product-card-body">
                            <h3 class="product-title"><a href="#" data-abc="true"><%#Eval("product_name") %></a></h3>
                            <h4 class="product-price">₹<%#Eval("product_price") %></h4>
                        </div>
                        <div class="product-button-group">
                            <a class="product-button btn-wishlist" href="removeProduct.aspx?pi=<%#Eval("product_id") %>" data-abc="true"><i class="fa fa-trash"></i><span>Remove</span></a>
                            <a class="product-button" href="Modify_product.aspx?pi=<%#Eval("product_id") %>" ><i class="fa fa-edit"></i><span>Modify</span></a>
                        </div>
                    </div>

                    <%--EDITING--%>
                    <%--<div class="modal fade" id='<%#Eval("product_id") %>' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog " role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="container">
                                    <div class="modal-body">
                                        <div class="form-row d-flex justify-content-center">
                                            <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/product_image/clemp oneside.jpg" BorderStyle="Solid" />
                                        </div>
                                        <asp:FileUpload CssClass="d-flex justify-content-center" ID="imageUpdate" runat="server" />

                                        <div class="form-row">
                                            <div class="form-group col-md-3">
                                                <label for="pName">Product Name</label>
                                                <asp:TextBox ID="pName" class="form-control" Text="" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="price">Price</label>
                                                <asp:TextBox ID="price" class="form-control" Text="" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="stock">Stock</label>
                                                <asp:TextBox ID="stock" class="form-control" Text="" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="desc">Description</label>
                                            <asp:TextBox ID="desc" class="form-control" Text="" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <asp:LinkButton ID="update" class="btn btn-primary" runat="server" CommandArgument='<%#Eval("product_id") %>'>Save changes</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:DataList>
        </div>

    </div>

</asp:Content>

