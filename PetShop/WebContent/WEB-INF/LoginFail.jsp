<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/estilos.css" type="text/css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    
    <title>Log In</title>
  </head>

  <body class="bodyLogin">
    <div class = "container col-lg-6 login">
		<div class="wrapper panel panel-default colorPanel">
			<div class="panel-body">
				<form action="start" method="post" name="Login_Form" class="form-signin">       
				    <h4 class="form-signin-heading">Sistema de Gesti&oacuten de Pet Shops</h4>
					  <hr class="colorgraph">
					  <h6 class="">Autenticaci&oacuten</h6>
					  <div class="input-group mb-2 mr-sm-2 mb-sm-2 has-danger">
					  	<div class="input-group-addon">
					  		<i class="fa fa-user" aria-hidden="true"></i>
					  	</div>
					  	
					  	<input type="text" class="form-control has-danger" name="Username" placeholder="Ingres&aacute tu usuario" value="<%=(String) session.getAttribute("userError")%>" required="" />
					  </div>
					  
					  <div class="input-group mb-2 mr-sm-2 mb-sm-2 has-danger">
					  	<div class="input-group-addon">
					  		<i class="fa fa-lock" aria-hidden="true"></i>
					  	</div>
					  	<input type="password" class="form-control has-error " name="Password" placeholder="Ingres&aacute tu contraseņa" value="<%=(String) session.getAttribute("passError")%>" required=""/>    		  
					  </div>
					  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit"><strong>INGRESAR</strong></button> 
					  <br>
						<div class="text-center">
							<small>
								Si olvidaste tu usuario o contrase&ntilde;a hac&eacute; click
								<a href="#blanquearUsuario" data-toggle="modal">
									<strong>AC&Aacute; </strong>
								</a>
							</small>
						</div> 
						<hr>
						<div class="">
							<a class="btn btn-info btn-block"  type = "button"><span class="fa fa-address-card""></span> ALTA NUEVOS USUARIOS </a> 
						</div> 					
						 							<!-- PANEL MODAL DE BLANQUEAR USUARIO -->
						<div class="modal fade" id="blanquearUsuario">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<strong>RECUPERACI&Oacute;N DE USUARIO</strong>
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<div class="form-horizontal form-group">
												<br>
												<div class="row-inline">
													<div class="col-xs-12 col-sm-2 centrado">
														<p><span class="fa fa-user-circle" style="font-size:70px"></span></p>
													</div>
													<div class="col-xs-12 col-sm-10 align-middle">
														<span class="text-muted align-middle">Si no record&aacute;s tu usuario o contrase&ntilde;a ingres&aacute; tu correo electr&oacute;nico para que te enviemos los datos de recuperaci&oacute;n</span>
													</div>
													<div class="col-xs-12 col-sm-10">
														<br class="visible-xs">
													</div>
													<div class="col-xs-12 col-sm-10" id="inputEmailGroup">
														<input class="form-control" placeholder="Correo electr&oacute;nico" id="inputEmail"></input>
													</div>
													<div class="col-xs-12 col-sm-10">
														<small class="text-danger hidden" id="emailValido">Deb&eacute;s ingresar un email v&aacute;lido</small>
													</div>
													<div id="barraProgreso" class="col-xs-12 col-sm-10 hidden">
														<div class="progress ">
															<div class="progress-bar progress-bar-primary progress-bar-striped active " role="progressbar" style="width:100%;min-width:100%";>
																<span class="">Enviando correo electr&oacute;nico</span>
															</div>
														</div>
													</div>
													<div  class="col-xs-12 col-sm-10">
														<div id="confirmacionEnvio" class="alert alert-success hidden">
															
														</div>
													</div>
													
															
												</div>
												<div class="row">
													<br>
													<br>
												</div>
												
												<div class="row">
													<div class="container-fluid pull-right">
														
														<div class="col-xs-12 col-sm-3 ">
															<button class="btn btn-primary btn-lg " id="btnEnviarEmail"><span class="fa fa-envelope"></span><strong> ENVIAR MAIL</strong></button>
														</div>
													</div>
													
												</div>
							
												<br>
											</div>
										</div>								
									</div>
								</div>
							</div>
						</div>			
				</form>	
			
				<br/>
				<div class="alert alert-warning confirmacion"><%=(String)session.getAttribute("mensaje")%>
			    	<button class="close" data-dismiss="alert"><span>&times;</span></button>
			    </div>  
			</div>  	   		    	  	
		</div>
	</div>
		
		<script type="text/javascript" src="/Petshop/js/jquery-latest.js"></script>
		<script type="text/javascript" src="/Petshop/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/Petshop/js/main.js"></script>
		<script type="text/javascript" src="/Petshop/js/login.js"></script>

</body>
</html>