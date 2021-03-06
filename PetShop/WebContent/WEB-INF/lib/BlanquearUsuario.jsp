<!DOCTYPE html>
<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="css/estilos.css" type="text/css">
	    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	    <title>Log In</title>
  	</head>

  	<body class="bodyLogin">
	    <div class="container col-lg-6 login">
			<div class="wrapper panel panel-default colorPanel">
				<div class="panel-body">
					<form action="Start" method="post" name="Login_Form" class="form-signin">       
					    <h4 class="form-signin-heading ">Sistema de Gesti&oacute;n de Pet Shops</h4>
						  <hr class="colorgraph">
						  <h5 class="">Autenticaci&oacute;n</h5>
						  <div class="input-group mb-2 mr-sm-2 mb-sm-2">
						  	<div class="input-group-addon">
						  		<i class="fa fa-user" aria-hidden="true"></i>
						  	</div>
						  	<label class="sr-only">Usuario</label>
						  	<input type="text" class="form-control" name="Username" placeholder="Ingres&aacute; tu usuario" required="" autofocus="" />
						  </div>
						  
						<div class="input-group mb-2 mr-sm-2 mb-sm-2">
							<div class="input-group-addon">
						  		<i class="fa fa-lock" aria-hidden="true"></i>
						  	</div>
						  	<label class="sr-only">Password</label>
						  	<input type="password" class="form-control" name="Password" placeholder="Ingres&aacute; tu contraseņa" required=""/>    		  
						</div>
						<button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit"><strong>INGRESAR</strong></button> 
						<br>
						<div class="text-center">
							<small>
								Si olvidaste tu usuario o contrase&ntilde;a hac&eacute; click
								<a href="#"> 
									<strong>AC&Aacute; </strong>
								</a>
							</small>
						</div> 
						<hr>
						<div class="">
							<a class="btn btn-info btn-block"  type = "button"><span class="fa fa-address-card"></span> ALTA NUEVOS USUARIOS </a> 
						</div> 					
						
					</form>	
				</div>
			</div>		
		</div>
		<script type="text/javascript" src="/Petshop/js/jquery-latest.js"></script>
		<script type="text/javascript" src="/Petshop/js/bootstrap.min.js"></script>
		
		<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>-->
	</body>
</html>