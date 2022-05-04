<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.master" AutoEventWireup="true" CodeFile="email_verification.aspx.cs" Inherits="user_email_verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head_content" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="modal-body">
            <div class="row">
                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/product_image/clemp oneside.jpg" />
            </div>
            <div class="row">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="pName">Product Name</label>
                        <input type="Name" class="form-control" id="pName" placeholder="Email">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputPassword4">Price</label>
                        <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                    </div>
                </div>
                <div class="form-group col-md-1">
                    <label for="inputAddress">Stock</label>
                    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress2">Address 2</label>
                <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
            </div>
        </div>
    </div>









    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Launch demo modal
    </button>


    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <div class="row">
                            <asp:Image ID="Image2" runat="server" Height="200px" ImageUrl="~/product_image/clemp oneside.jpg" />
                        </div>
                        <div class="row">
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="pName">Product Name</label>
                                    <input type="Name" class="form-control" id="pName" placeholder="Email">
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="inputPassword4">Price</label>
                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group col-md-1">
                                <label for="inputAddress">Stock</label>
                                <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                            </div>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="inputAddress2">Address 2</label>
                            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

