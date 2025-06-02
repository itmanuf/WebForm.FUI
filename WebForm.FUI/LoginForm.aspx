<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="WebForm.FUI.LoginForm" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>User - Login</title>
    
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/login/Template" rel="stylesheet">
    
    <!-- Custom styles for this template-->
    <link href="css/login/sb-admin-2.min.css" rel="stylesheet">

</head>
<body>
    
    <div class="container">
        
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Login</h1>

                                    </div>
                                    
                                    <form class="user" runat="server">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="exampleInputEmail" CssClass="form-control form-control-user" placeholder="Enter Email Address..."></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                            <asp:TextBox  class="form-control form-control-user" id="exampleInputPassword" runat="server" placeholder="Password"></asp:TextBox>
                                        </div>

                                        <div class="form-group">
                                            <asp:TextBox id="txtcompany" class="form-control form-control-user" runat="server"  placeholder="Company" value="Inkom" ></asp:TextBox>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" Text=""></asp:Label>
                                        </div>
                                        
                                        <asp:Button id="btnLogin" runat="server" class="btn btn-primary btn-user btn-block" Text="Login" OnClick="btnLogin_Click"/> 
                                        
                                        <hr>                                    
                                  </form>
                                <hr>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

    <script>
        function validateForm() {
            var email = document.getElementById("exampleInputEmail").value;
            var password = document.getElementById("exampleInputPassword").value;

            // Validasi Email
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!email.match(emailPattern)) {
                alert("Invalid email format!");
                return false;
            }

            // Validasi Password
            if (password.length < 6) {
                alert("Password must be at least 6 characters!");
                return false;
            }

            return true;
        }

    </script>
    
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>
</html>
