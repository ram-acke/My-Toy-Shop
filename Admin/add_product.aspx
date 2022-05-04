<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="Admin_add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        function preview_image(event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('previewImg');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

    <style>
        .alert {
            padding: 20px;
            background-color: #f44336;
            /*background-color:#04AA6D;*/
            color: white;
        }

        .alert2 {
            padding: 20px;
            background-color: #04AA6D;
            color: white;
        }

        .closebtn {
            margin-left: 15px;
            color: white;
            font-weight: bold;
            float: right;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

            .closebtn:hover {
                color: black;
            }

        .m-3 {
            margin: 0rem !important;
            width: 20%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="alert" visible="false" id="error_alert" runat="server">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <strong>Invalid Data</strong> Enter Proper Details of Product
    </div>

    <div class="alert2" visible="false" id="success_alert" runat="server">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <strong>Product Added</strong> Successfully...
    </div>


    <div class="container main">
        <div class="row">
            <div class="col-12">
                <h1 class="text-black justify-content-center d-flex" style="font-size: 32px;">Add Products</h1>
            </div>
        </div>


        <div class="row">
            <div class="col-12  justify-content-center d-flex">
                <div class="row gy-2 gx-3 align-items-center">
                    <div class="col-auto m-3">
                        <asp:Label ID="Label1" runat="server" Text="Label">Product ID</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="product_id" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="product_id" class="form-control" runat="server" MaxLength="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="product_id" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{4}">Enter Valid Product Id</asp:RegularExpressionValidator>
                    </div>
                    <div class="col-auto m-3">
                        <asp:Label ID="Label2" runat="server" Text="Label">Product Name</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="product_name" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <div class="input-group">
                            <asp:TextBox ID="product_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-auto m-3">
                        <asp:Label ID="Label5" runat="server" Text="Label">Product Price</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="product_price" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <div class="input-group">
                            <asp:TextBox ID="product_price" class="form-control" runat="server" MaxLength="5"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="product_price" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^\d+$">Enter Correct Price</asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="col-auto m-3">
                        <asp:Label ID="Label3" runat="server" Text="Label">Stock</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="stock" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <div class="input-group">
                            <asp:TextBox ID="stock" class="form-control" runat="server" MaxLength="3"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="stock" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^\d+$">Enter Correct Stock</asp:RegularExpressionValidator>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12  justify-content-center d-flex">
                <div class="row gy-2 gx-3 align-items-center">
                    <div class="col-auto m-3">
                        <div class="row">
                            <asp:Label ID="Label6" runat="server" Text="Label">Product Description</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="product_description" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <asp:TextBox ID="product_description" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>

                        </div>
                    </div>

                    <div class="col-auto m-3">
                        <img id="previewImg" src="img/UploadImg.jpg" alt="Placeholder" style="height: 200px" />
                        <div class="col-auto m-3">
                            <asp:Label ID="Label4" runat="server" Text="Label">Product Image</asp:Label>
                            <div class="input-group">
                                <asp:FileUpload ID="product_image" onchange="preview_image(event)" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="product_image" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class="row justify-content-center d-flex">
            <div class="col-auto mb-3">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add Product" OnClick="Button1_Click" />
            </div>
        </div>


        <div class="row results">
        </div>
    </div>



</asp:Content>

