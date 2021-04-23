<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.login" %>

<!DOCTYPE html>

<html lang="en">
<head>
	<title>Login V12</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Logincss/images/icons/favicon.ico"/>
<!--===============================================================================================-->

    <link href="Logincss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <link href="Logincss/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <link href="Logincss/fonts/iconic/css/material-design-iconic-font.min.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <link href="Logincss/vendor/animate/animate.css" rel="stylesheet" />
<!--===============================================================================================-->	
	
    <link href="Logincss/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <link href="Logincss/vendor/animsition/css/animsition.min.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <link href="Logincss/vendor/select2/select2.min.css" rel="stylesheet" />
<!--===============================================================================================-->	
	
    <link href="Logincss/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <link href="Logincss/css/util.css" rel="stylesheet" />
	
    <link href="Logincss/css/main.css" rel="stylesheet" />
<!--===============================================================================================-->
</head>
<body>
    <div class="limiter">
		<div class="container-login100" style="background-image: url('Logincss/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" id="form1" runat="server">
                   
                       <span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>


                    <%--USUARIO--%>
                        

                      <div class="wrap-input100 validate-input" data-validate = "Enter username">
                        <asp:TextBox ID="txtUsuario" placeholder="User name" runat="server" class="input100"></asp:TextBox>
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>
                    <%--CONTRASEÑA--%>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <%--<span class="label-input100">Contraseña</span>--%>
                        <asp:TextBox ID="txtContraseña" runat="server" class="input100" placeholder="Password" Type="password"></asp:TextBox>
                        <span class="focus-input100" data-placeholder="&#xf191;"></span>
                    </div>
                    
                    <%--BOTON--%>
                    <div class="container-login100-form-btn p-t-10">
                        <asp:Button ID="btnAceptar" runat="server" class="login100-form-btn" Text="Aceptar" OnClick="btnAceptar_Click" />
                        <asp:Label ID="lblMensaje" runat="server" Text="."></asp:Label>
                    </div>
                        <%--RECUPERACION--%>
                    <div class="text-center w-full p-t-25 p-b-230">
                        
                            <a href="#" class="txt1" onclick="window.open('RecuperarCorreo.aspx','FP','width=500,height=50,top=300,left=500,fullscreeen=no,resizable=0');">¿Has olvidado tu contraseña?</a>
                        
                    </div>
                </form>
			</div>
		</div>
	</div>

    

   <!--===============================================================================================-->
	
    <script src="Logincss/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	
    <script src="Logincss/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	
    <script src="Logincss/vendor/bootstrap/js/popper.js"></script>
	
    <script src="Logincss/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	
    <link href="Logincss/vendor/select2/select2.min.css" rel="stylesheet" />
<!--===============================================================================================-->
	
    <script src="Logincss/vendor/daterangepicker/moment.min.js"></script>
	
    <script src="Logincss/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	
    <script src="Logincss/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	
    <script src="Logincss/js/main.js"></script>

</body>
</html>
