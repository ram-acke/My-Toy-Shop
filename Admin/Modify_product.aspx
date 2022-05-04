<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Modify_product.aspx.cs" Inherits="Admin_Modify_product" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container w-50">
        <div class="modal-body">
            <div class="form-row d-flex justify-content-center">
                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/product_image/clemp oneside.jpg" BorderStyle="Solid" />
            </div>
            <br />
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
                </div> <div class="form-group col-md-2">
                    <label for="stock">Product Id</label>
                    <asp:TextBox ID="pId" class="form-control" Text="" disabled="" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label for="desc">Description</label>
                <asp:TextBox ID="desc" class="form-control" Text="" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <asp:Button ID="update" class="btn btn-primary" runat="server" Text="Update Changes" OnClick="update_Click" />
            <a href="product_list.aspx" class="btn btn-secondary">Cancel</a>
        </div>
    </div>
</asp:Content>

