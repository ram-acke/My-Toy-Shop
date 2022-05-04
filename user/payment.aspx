<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="user_payment" EnableEventValidation="false" %>

<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Payment</title>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:weight@100;200;300;400;500;600;700;800&display=swap");

        body {
            background-color: #f5eee7;
            font-family: "Poppins", sans-serif;
            font-weight: 300;
        }

        .container {
            height: 100vh;
        }

        .card {
            border: none;
        }

        .card-header {
            padding: .5rem 1rem;
            margin-bottom: 0;
            background-color: rgba(0, 0, 0, .03);
            border-bottom: none;
        }

        .btn-light:focus {
            color: #212529;
            background-color: #e2e6ea;
            border-color: #dae0e5;
            box-shadow: 0 0 0 0.2rem rgba(216, 217, 219, .5);
        }

        .form-control {
            height: 50px;
            border: 2px solid #eee;
            border-radius: 6px;
            font-size: 14px;
        }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #039be5;
                outline: 0;
                box-shadow: none;
            }

        .input {
            position: relative;
        }

            .input i {
                position: absolute;
                top: 16px;
                left: 11px;
                color: #989898;
            }

            .input input {
                text-indent: 25px;
            }

        .card-text {
            font-size: 13px;
            margin-left: 6px;
        }

        .certificate-text {
            font-size: 12px;
        }

        .billing {
            font-size: 11px;
        }

        .super-price {
            top: 0px;
            font-size: 22px;
        }

        .super-month {
            font-size: 11px;
        }

        .line {
            color: #bfbdbd;
        }

        .free-button {
            background: #1565c0;
            height: 52px;
            font-size: 15px;
            border-radius: 8px;
        }

        .payment-card-body {
            flex: 1 1 auto;
            padding: 24px 1rem !important;
        }
        .exdate{
            margin-left: -23px;
            padding:0px;
        }
    </style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center mt-5 mb-5">
            <div class="row g-3">
                <div class="col-md-6">
                    <span>Payment Method</span>
                    <div class="card">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-header p-0" id="headingTwo">
                                    <h2 class="mb-0">
                                        <button class="btn btn-light btn-block text-left collapsed p-3 rounded-0 border-bottom-custom" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <span>Paypal</span>
                                                <img src="https://i.imgur.com/7kQEsHU.png" width="30">
                                            </div>
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <asp:TextBox ID="paypal" class="form-control" placeholder="Paypal email" runat="server"></asp:TextBox>
                                                    <asp:Label ID="paypalERROR" runat="server" style="font-weight: 700; color: #FF0000; font-size: x-small;" Text="Invalid PayPal Address..." Visible="False"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header p-0">
                                    <h2 class="mb-0">
                                        <button class="btn btn-light btn-block text-left p-3 rounded-0" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <span>Credit card</span>
                                                <div class="icons">
                                                    <img src="https://i.imgur.com/2ISgYja.png" width="30">
                                                    <img src="https://i.imgur.com/W1vtnOV.png" width="30">
                                                    <img src="https://i.imgur.com/35tC99g.png" width="30">
                                                    <img src="https://i.imgur.com/2ISgYja.png" width="30">
                                                </div>
                                            </div>
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body payment-card-body">
                                        <span class="font-weight-normal card-text">Card Number</span>
                                        <div class="input">
                                            <i class="fa fa-credit-card"></i>
                                            <asp:TextBox ID="cardNO" class="form-control" placeholder="0000 0000 0000" runat="server" MaxLength="12"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cardNO" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{12}">Invalid Card No..</asp:RegularExpressionValidator>
                                        </div>
                                        <div class="row mt-3 mb-3">
                                            <div class="col-md-2">
                                                <span class="font-weight-normal card-text">Expiry Date</span>
                                                <div class="input">
                                                    <i class="fa fa-calendar"></i>
                                                    <asp:TextBox ID="ExpireMonth" class="form-control" placeholder="MM" runat="server" MaxLength="2"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ExpireMonth" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{2}">Invalid ExpireDate</asp:RegularExpressionValidator>
                                                &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ExpireMonth" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="12" MinimumValue="01">Invalid Month</asp:RangeValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <span class="font-weight-normal text-light card-text">_</span>
                                                <div class="input">
                                                    <asp:TextBox ID="ExpireYear" class="form-control exdate" placeholder="YY" runat="server" MaxLength="2"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ExpireYear" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{2}">Invalid ExpireDate</asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <span class="font-weight-normal card-text">CVC/CVV</span>
                                                <div class="input">
                                                    <i class="fa fa-lock"></i>
                                                    <asp:TextBox ID="CVV" class="form-control" placeholder="000" runat="server" MaxLength="3" TextMode="Password"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="CVV" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0-9]{3}">Invalid CVV</asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="text-muted certificate-text"><i class="fa fa-lock"></i>Your transaction is secured with ssl certificate</span>
                                        <br />
                                                    <asp:Label ID="Carderror" runat="server" style="font-weight: 700; color: #FF0000; font-size: x-small;" Text="Invalid Card Details..." Visible="False"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span>Summary</span>
                    <div class="card">
                        <div class="d-flex justify-content-between p-3">
                            <div class="d-flex flex-column">
                                <span>
                                    <asp:Label ID="PNAME" runat="server" Text="RO Water MODEL 142" Style="font-weight: 700"></asp:Label>
                                </span>
                            </div>
                            <div class="mt-1"><sup class="super-price">₹<asp:Label ID="PPRICE" runat="server" Text="12000" Style="color: #0000CC"></asp:Label></sup> </div>
                        </div>
                        <hr class="mt-0 line">
                        <div class="p-3">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Product Quantity</span> <span>x 
                                <asp:Label ID="qty" runat="server" Text="4" Style="font-style: italic"></asp:Label></span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Total Amount</span> <span>₹
                                <asp:Label ID="total" runat="server" Text="48000" Style="font-style: italic"></asp:Label></span>
                            </div>
                            <div class="d-flex justify-content-between"><span>Delivery Charger</span><span>+ ₹<asp:Label ID="DCHARGE" runat="server" Text="70" Style="color: #0000CC"></asp:Label></span> </div>
                        </div>
                        <hr class="mt-0 line">
                        <div class="p-3 d-flex justify-content-between">
                            <div class="d-flex flex-column"><span>Total Paying Amount </span></div>
                            <span>₹<asp:Label ID="payingAMOUNT" runat="server" Text="48070" Style="font-weight: 700; color: #009933"></asp:Label></span>
                        </div>
                        <div class="p-3">
                            <asp:Button ID="payNow" class="btn btn-primary btn-block free-button" runat="server" Text="Pay Now" OnClick="payNow_Click" />
                            <div><asp:LinkButton ID="cancelPayment"  CssClass="text-center d-flex justify-content-center" runat="server" OnClick="cancelPayment_Click">Cancel Payment</asp:LinkButton></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>

</body>
</html>
