<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list_of_products.aspx.cs" Inherits="Admin_list_of_products" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>
    <h1>Hello, world!</h1>
    <header class="main-header clearfix" style="position:relative">
        <div class="logo">
            <a href="#"><em>Murlidhar</em> Water Purifiers</a>
        </div>
        <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
        <nav id="menu" class="main-nav" role="navigation">
            <ul class="main-menu">
                <li><a href="index.aspx">Home</a></li>
                <li class="has-submenu"><a href="#section2">Customers</a>
                    <ul class="sub-menu">
                        <li><a href="order_list.aspx">Order List</a></li>
                        <li><a href="customer_list.aspx">Customer List</a></li>
                        <li><a href="#section3">How it works?</a></li>
                    </ul>
                </li>
                <li class="has-submenu"><a href="#section2">Manage Products</a>
                    <ul class="sub-menu">
                        <li><a href="add_product.aspx">Add Products</a></li>
                        <li><a href="product_list.aspx">Product List</a></li>
                        <li><a href="#section3">Product Status</a></li>
                    </ul>
                </li>
                <li><a href="#section6">Logout</a></li>
            </ul>
        </nav>
    </header>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
