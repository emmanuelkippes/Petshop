<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Usuario"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<meta charset="UTF-8">
		<jsp:include page="cssGeneral.jsp" />

		<title>SGPS - Alta nuevo cliente</title>
	</head>
	<body class="bodyLogin">
		<div>
			<br>
			<br>
		</div>
		<div class="container panel panel-default colorPanel">
			<div class="panel-body">
				<br>
					
				<h4><strong>REGISTRACI&Oacute;N DE USUARIO NUEVO</strong></h4>
				<hr>
				
				<div class="container-fluid">
					<form class="form" action="#" method="post" enctype="multipart/form-data" id="form_nuevo_cliente">
		            	
						<div class="form-group row">
							<div class="container-fluid">
								<h4><strong class="text-muted">COMPLET&Aacute; TODOS TUS DATOS</strong></h4>
		            	  	
							</div>
							<!-- Input de usuario -->
			            		<label class="sr-only">Usuario</label>
							    <div class="col-lg-4 col-md-12" id="usuarioGroup">
							    	<small id="usuarioHelp" class="form-text text-muted"><strong>Usuario*</strong></small>
							    	<input type="text" class="form-control" name="usuario" id="usuario" aria-describedby="usuarioHelp" placeholder="Ingres&aacute; un nombre de usuario">
								</div>
								
							<!-- Input de contrase�a -->
								<label class="sr-only">Contrase�a</label>
							    <div class="col-lg-4 col-md-12" id="contraseniaGroup">
							    	<small id="contraseniaHelp" class="form-text text-muted"><strong>Contrase&ntilde;a*</strong></small>
							    	<input type="password" class="form-control" name="contrasenia" id="contrasenia" aria-describedby="contraseniaHelp" placeholder="Ingres&aacute; una contrase&ntilde;a">
								</div>
								
							<!-- Input de contrase�a -->
								<label class="sr-only">Contrase�a</label>
							    <div class="col-lg-4 col-md-12" id="contraseniaRepetirGroup">
							    	<small id="contraseniaRepetirHelp" class="form-text text-muted"><strong>Repet&iacute; la contrase&ntilde;a*</strong></small>
							    	<input type="password" class="form-control" name="contraseniaRepetir" id="contraseniaRepetir" aria-describedby="contraseniaRepetirHelp" placeholder="Repet&iacute; la contrase&ntilde;a">
								</div>
						</div>
						<hr>
		            	<div class="form-group row">
		            	  	<!-- Input de nombre -->
			            		<label class="sr-only">Nombre</label>
							    <div class="col-lg-6 col-md-12" id="nombreGroup">
							    	<small id="nombreHelp" class="form-text text-muted"><strong>Nombre*</strong></small>
							    	<input type="text" class="form-control" name="nombre" id="nombre" aria-describedby="nombreHelp" placeholder="Ingres&aacute; tu nombre">
								</div>
								
							<!-- Input de apellido -->
								<label class="sr-only">Apellido</label>
							    <div class="col-lg-6 col-md-12" id="apellidoGroup">
							    	<small id="apellidoHelp" class="form-text text-muted"><strong>Apellido*</strong></small>
							    	<input type="text" class="form-control" name="apellido" id="apellido" aria-describedby="apellidoHelp" placeholder="Ingres&aacute; tu apellido">
								</div>
						</div>
						<hr>
						
						<div class="form-group row">
			            	<!-- Input de dni-->
			            		<label class="sr-only">DNI</label>
							    <div class="col-lg-6 col-md-12" id="dniGroup">
							    	<small id="precioHelp" class="form-text text-muted"><strong>Dni</strong></small>
							    	<input type="text" class="form-control" name="dni" id="dni" aria-describedby="dniHelp" placeholder="Ingres&aacute; tu dni">
								</div>
								
							<!-- Input de direccion -->
								<label class="sr-only">Direcci&oacute;n</label>
							    <div class="col-lg-6 col-md-12" id="direccionGroup">
							    	<small id="direccionHelp" class="form-text text-muted"><strong>Direcci&oacute;n</strong></small>
							    	<input type="text" min="0"class="form-control" name="direccion" id="direccion" aria-describedby="direccionHelp" placeholder="Ingres&aacute; tu direcci&oacute;n">
								</div>
						</div>
						<hr>
						
						<div class="form-group row">
							<!-- Input de telefono -->
								<label class="sr-only">Tel&eacute;fono</label>
							    <div class="col-lg-6 col-md-12" id="telefonoGroup">
							    	<small id="direccionHelp" class="form-text text-muted"><strong>Tel&eacute;fono*</strong></small>
							    	<input type="text" class="form-control telefono" name="telefono" id="telefono" aria-describedby="telefonoHelp" placeholder="Ingres&aacute; tu tel&eacute;fono, sin guiones ni espacios">
								</div>
						         	
			            	<!-- Input de email-->
			            		<label class="sr-only">Email</label>
							    <div class="col-lg-6 col-md-12" id="emailGroup">
							    	<small id="emailHelp" class="form-text text-muted"><strong>Email</strong></small>
							    	<input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Ingres&aacute; tu direcci&oacute;n de email">
								</div>
								<div class="col-xs-12">
									<br>
									<small class="text-muted">Los campos marcados con (*) son obligatorios</small>
								</div>
								
						</div>
						<hr>
						<h4><strong class="text-muted">SI QUER&Eacute;S AGREGAR MASCOTAS, HACELO A CONTINUACI&Oacute;N</strong></h4>
						<div class="form-group row ">
							<label class="sr-only">Mascota</label>
							<div class="col-lg-3 col-md-12">
								<a href="" class="btn btn-primary form-control" id="btnAgregarMascota" data-toggle="modal"> <span class="glyphicon glyphicon-plus"></span> Agregar Mascota</a>
							</div>
							<div class="col-lg-9 col-md-12" id="MascotaGroup">	
								<div class="table-responsive hidden" id="tablaMascota">
   								   <table class="table table-striped table-hover active tableMas" id="tableMas">
										<thead>
											<tr>
											    <th>Nombre</th>
											    <th>Pelaje</th>
											    <th>Tama�o</th>
											    <th>Fecha de Nacimiento</th>
											    <th>Quitar</th>
											</tr>
										</thead>
  										<tbody>	
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<hr>
									
						<div class="form-group row">	
							<div class="col-lg-12">
								<input type="submit" id="btnAltaClienteOnline" value="Confirmar" class="col-lg-2 col-xs-12 btn btn-primary btn-lg pull-right">
							</div>
						</div>
						<div id="final">
						</div>
						<!-- PANEL MODAL AGREGAR MASCOTA -->
						<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="agregarMascotaModificar">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<strong>AGREGAR MASCOTA</strong>
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<div class="form-group row container-fluid">
										<!-- Input de idMascota -->
			            		
							   					 <input type="text" class="hidden" name="idMascotaHidden" id="idMascotaHidden" aria-describedby="idMascotaHelp">
										
											<!-- Input de Nombre Mascota -->
												<label class="sr-only">Nombre</label>
											    <div class="col-lg-12 col-md-12" id="nombreMascotaGroup">
											    	<small id="nombreMascotaHelp" class="form-text text-muted"><strong>Nombre *</strong></small>
											    	<input type="text" class="form-control nombreMascota" name="nombreMascota" id="nombreMascota" placeholder ="Ingres&aacute; el nombre de la mascota.">
												</div>
										</div>
										<hr class="hrModal">
										<div class="form-group row">
											<div class="col-lg-6 col-md-12">	
												<div class="container-fluid">
													<h4><strong>TAMA&Ntilde;O DEL PERRO *</strong></h4>
												</div>
												<div class="container-fluid" id="patitaGroup">
													<div class="col-sm-4 centrado">
														<label class="sr-only">Perro grande</label>
														<button class="icon-button" id="btnPatitaGrande">						
															<span class="fa fa-paw" style="font-size:90px"></span>
															<p><strong class="text-center"> GRANDE </strong></p>
														</button>								
													</div>
													<div class="col-sm-4 centrado">
														<label class="sr-only">Perro mediano</label>
														<button class="icon-button" id="btnPatitaMediana">						
															<span class="fa fa-paw" style="font-size:70px;margin-top:20px"></span>
															<p><strong class="text-center"> MEDIANO </strong></p>	
														</button>			
													</div>
													<div class="col-sm-4 centrado">
														<label class="sr-only">Perro chico</label>
														<button class="icon-button" id="btnPatitaChica">						
															<span class="fa fa-paw" style="font-size:50px;margin-top:40px"></span>
															<p><strong class="text-center"> CHICO </strong></p>		
														</button>					
													</div>
												</div>
											</div>
											
											<div class="col-lg-6 col-md-12">	
												<div class="container-fluid">
													<h4><strong>PELAJE *</strong></h4>
												</div>
												<div class="container-fluid" id="pelajeGroup">
													<div class="col-sm-4 centrado">
														<label class="sr-only">Tamano del pelaje</label>
														<button class="icon-button" id="btnTijeraGrande">						
															<span class="fa fa-scissors" style="font-size:90px"></span>
															<p><strong class="text-center"> LARGO </strong></p>
														</button>								
													</div>
													<div class="col-sm-4 centrado">
														<label class="sr-only">Tamano del pelaje</label>
														<button class="icon-button"id="btnTijeraChica">						
															<span class="fa fa-scissors" style="font-size:70px;margin-top:20px"></span>
															<p><strong class="text-center"> CORTO </strong></p>
														</button>								
													</div>
												</div>
											</div>
										</div>
										<hr class="hrModal">
										<div class="form-group row container-fluid">
											<!-- Input de Fecha de Nacimiento Mascota -->
												<label class="sr-only">Fecha de Nacimiento</label>
											    <div class="col-lg-4 col-md-12" id="fechaNacimientoMascotaGroup">
											    	<small id="fechaNacimientoMascotaHelp" class="form-text text-muted"><strong>Fecha de Nacimiento *</strong></small>
											    	<input type="date" class="form-control" name="fechaNacimientoMascota" id="fechaNacimientoMascota" aria-describedby="fechaNacimientoMascotaHelp">
												</div>
												
												<!-- Input de Observaciones Mascota -->
												<label class="sr-only">Observaciones</label>
											    <div class="col-lg-8 col-md-12" id="observacionesMascotaGroup">
											    	<small id="observacionesMascotaHelp" class="form-text text-muted"><strong>Observaciones</strong></small>
											    	<textarea class="form-control" rows="5" id="observacionesMascota" placeholder="Completa con datos adicionales de la mascota de ser necesarios"></textarea>
												</div>
										</div>
										<hr class="hrModal">
										<div class="form-group row container-fluid">
											<div class="col-lg-12 col-md-12">
												<button class="col-lg-3 col-md-12 btn btn-primary pull-right btnAgregarMascotaModalAlta" id="btnAgregarMascotaModalAlta"><h4><span class="fa fa-paw"></span> Confirmar</h4></button>
											</div>
										</div>
									</div>								
								</div>
							</div>
						</div>
						
		            </form> 
		        </div>
		   	</div>
		</div>
			<jsp:include page="jsGeneral.jsp" />
			<script type="text/javascript" src="js/clienteOnline.js"></script>
	</body>
</html>